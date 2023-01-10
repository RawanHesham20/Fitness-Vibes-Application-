import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yarab/services/snackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  Future<void> signupwithEmail({
    required String email,
    required String password,
    required BuildContext context,
    //for snackbar
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code=='weak-password'){
         showSnackBar(context, 'you gave a wrong password');
      }
      showSnackBar(context, e.message!);
    }
  }
}
