// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String profilepic;
  final String bannar;
  final String uid;
  final List<String> tasks;
  UserModel({
    required this.name,
    required this.profilepic,
    required this.bannar,
    required this.uid,
    required this.tasks,
  });

  UserModel copyWith({
    String? name,
    String? profilepic,
    String? bannar,
    String? uid,
    List<String>? tasks,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilepic: profilepic ?? this.profilepic,
      bannar: bannar ?? this.bannar,
      uid: uid ?? this.uid,
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilepic': profilepic,
      'bannar': bannar,
      'uid': uid,
      'tasks': tasks,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilepic: map['profilepic'] as String,
      bannar: map['bannar'] as String,
      uid: map['uid'] as String,
      tasks: List<String>.from(
        (map['tasks'] as List<String>),
      ),
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, profilepic: $profilepic, bannar: $bannar, uid: $uid, tasks: $tasks)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.profilepic == profilepic &&
        other.bannar == bannar &&
        other.uid == uid &&
        listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilepic.hashCode ^
        bannar.hashCode ^
        uid.hashCode ^
        tasks.hashCode;
  }
}
