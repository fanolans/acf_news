import 'dart:async';

import 'package:acf_news/presentations/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user_model.dart';

FirebaseAuth auth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference mainCollection = _firestore.collection('user');

class FirebaseServices {
  static String? userUid;

  Future<UserCredential> signInWithGoogleNew() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<bool> searchUser({required String id}) async {
    final DocumentSnapshot doc = await mainCollection.doc(id).get();

    return doc.exists ? true : false;
  }

  Future<void> registergoogleSignIn({required User user}) async {
    try {
      final userACF = UserACF(
        id: user.uid,
        username: user.displayName!,
        email: user.email!,
        password: user.uid,
      );

      return mainCollection
          .doc(auth.currentUser!.uid)
          .set(userACF.toMap())
          .whenComplete(() => print("User Has been Created"))
          .catchError(
            (e) => print(
              e,
            ),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    user = userCredential.user;
    return user;
  }

  static Future<UserCredential> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future signOut({required BuildContext context}) async {
    await auth.signOut().whenComplete(
      () async {
        if (await googleSignIn.isSignedIn()) {
          await googleSignIn.signOut().whenComplete(
                () => Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginPage.routeName,
                  (route) => false,
                ),
              );
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            LoginPage.routeName,
            (route) => false,
          );
        }
      },
    );
  }

  Future<UserACF> fetchUSer({required String uid}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection("user")
            .where(
              'id',
              isEqualTo: uid,
            )
            .get();

    final data = snapshot.docs.map((e) => UserACF.fromMap(e)).first;
    streamUserData.sink.add(data);
    return data;
  }

  static Future<void> updateInformationAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    DocumentReference documentReferencer = mainCollection.doc(userUid);

    Map<String, dynamic> data = <String, dynamic>{
      "userName": name,
      "email": email,
      "password": password,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Information item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateUser({
    required String idUser,
    required String username,
    required String email,
    required String password,
  }) async {
    var data = <String, dynamic>{
      "username": username,
      "email": email,
      "password": password,
    };

    mainCollection
        .doc(idUser)
        .update(data)
        .whenComplete(() => print('User data sukses di update'))
        .catchError(
      (e) {
        print(e);
      },
    );
  }

  StreamController<UserACF> streamUserData = StreamController();
}
