import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserACF {
  String id;
  String username;
  String email;
  String password;
  UserACF({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory UserACF.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserACF(
      id: doc.id,
      username: doc.data()!['username'],
      email: doc.data()!['email'] ?? '',
      password: doc.data()!['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserACF.fromJson(String source) =>
      UserACF.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, password: $password)';
  }
}
