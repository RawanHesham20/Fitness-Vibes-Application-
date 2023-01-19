import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:ui';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _googlesignIn = GoogleSignIn();
  final userDoc = FirebaseFirestore.instance.collection('users').doc();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userrole = "User";

  SignInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await _googlesignIn.signIn();
      //should pop a screen of your own wmail
      if (GoogleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await gUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(credential);
       
        
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }

    // final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // final credential = GoogleAuthProvider.credential(
    //   accessToken: gAuth.accessToken,
    //   idToken: gAuth.idToken,
    // );

    // return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
