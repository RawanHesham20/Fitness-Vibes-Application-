import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yarab/Data/classbooking.dart';
import 'package:yarab/Data/mySessions.dart';
import 'package:yarab/Screens/Admins/loginAdmin.dart';
import 'package:yarab/Screens/Users/allClasses.dart';
import 'package:yarab/Screens/Users/contactUs.dart';
import 'package:yarab/Screens/Users/fitnessApp.dart';
import 'package:yarab/Screens/Users/login.dart';
import 'package:yarab/Screens/Users/register.dart';
import 'package:yarab/Screens/profile.dart';
import 'package:yarab/Screens/welcomepage.dart';
import 'package:yarab/services/auth.dart';
import 'Data/spa.dart';
import 'Screens/Users/nutrition.dart';
import 'firebase_options.dart';
import 'package:go_router/go_router.dart';
import 'package:yarab/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routerDelegate: AppRouter().router.routerDelegate,
      routeInformationParser: AppRouter().router.routeInformationParser,
      routeInformationProvider: AppRouter().router.routeInformationProvider,
    );
  }
}
