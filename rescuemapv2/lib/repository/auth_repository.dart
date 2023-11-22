import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rescuemapv2/components/constants.dart';
import 'package:rescuemapv2/model/user_model.dart';
import 'package:rescuemapv2/provider/firebase_provider.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider)));

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;
  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      UserModel(
          name: userCredential.user!.displayName ?? "No Name",
          profilepic: userCredential.user!.photoURL ?? Constants.avatardefault,
          bannar: Constants.bannerdefault,
          uid: userCredential.user!.uid,
          tasks: []);
      await _users.doc(userCredential.user!.uid).set(UserModel(
          name: userCredential.user!.displayName ?? "No Name",
          profilepic: userCredential.user!.photoURL ?? Constants.avatardefault,
          bannar: Constants.bannerdefault,
          uid: userCredential.user!.uid,
          tasks: []));
    } catch (e) {
      print(e);
    }
  }
}
