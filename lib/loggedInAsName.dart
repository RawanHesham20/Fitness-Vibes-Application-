import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'Users/fitnessApp.dart';

class Loggedinauth extends StatelessWidget {
  const Loggedinauth({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Logged In As', style: TextStyle(fontSize: 16),),
          const SizedBox(height: 8),
          Text(
            user.email!,
            style: const TextStyle(fontSize: 20, color: Colors.purple),
          ),
          const SizedBox(height: 40,),
            ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
               backgroundColor: Color(0xFF9340BA)
               ,minimumSize: const Size.fromHeight(30)),
            icon: const Icon(Icons.login),
            label: const Text(
              'Welcome page',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
                        GoRouter.of(context).go('/toWelcome');
                      },
          ),
           const SizedBox(height: 40,),
           ElevatedButton.icon(
            style: ElevatedButton.styleFrom( backgroundColor: Color(0xFF9340BA),
            minimumSize: const Size.fromHeight(30)),
            icon: const Icon(Icons.arrow_back),
            label: const Text(
              'Sign out',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: (() => FirebaseAuth.instance.signOut())
          ),
        ],
      ),),
    );
  }
}
