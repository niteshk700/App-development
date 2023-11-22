// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDp2HAh-h9eocHd43sJkklk3puBm1IBb2Q',
    appId: '1:848963123165:web:d2070aa784203fea6d6834',
    messagingSenderId: '848963123165',
    projectId: 'rescuemapver2',
    authDomain: 'rescuemapver2.firebaseapp.com',
    storageBucket: 'rescuemapver2.appspot.com',
    measurementId: 'G-HNRZYFHR18',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD0VyzJWyPh8dknEN4ynYid7C4tuaS0Obg',
    appId: '1:848963123165:android:5ef12516f6802ef56d6834',
    messagingSenderId: '848963123165',
    projectId: 'rescuemapver2',
    storageBucket: 'rescuemapver2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrP7YLikWnnUgaepTrp7xBiadmp_ay4h4',
    appId: '1:848963123165:ios:84c7cf17d3cabdb96d6834',
    messagingSenderId: '848963123165',
    projectId: 'rescuemapver2',
    storageBucket: 'rescuemapver2.appspot.com',
    iosBundleId: 'com.example.rescuemapv2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrP7YLikWnnUgaepTrp7xBiadmp_ay4h4',
    appId: '1:848963123165:ios:860a8fab491a858d6d6834',
    messagingSenderId: '848963123165',
    projectId: 'rescuemapver2',
    storageBucket: 'rescuemapver2.appspot.com',
    iosBundleId: 'com.example.rescuemapv2.RunnerTests',
  );
}
