import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yarab/Screens/Users/fitnessApp.dart';
import 'package:yarab/Screens/Users/login.dart';
import '../Screens/loggedInAsName.dart';

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //any changes the builder will rebuild
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Somthing went wrong'));
          } else if (snapshot.hasData) {
            return Loggedinauth();
          } else {
            return myLogin();
          }
        },
      )
    );
  }
}