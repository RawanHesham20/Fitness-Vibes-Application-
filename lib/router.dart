import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yarab/services/auth.dart';

import 'Data/classbooking.dart';
import 'Data/mySessions.dart';
import 'Screens/Admins/loginAdmin.dart';
import 'Screens/Users/allClasses.dart';
import 'Screens/Users/contactUs.dart';
import 'Screens/Users/fitnessApp.dart';
import 'Screens/Users/login.dart';
import 'Screens/Users/nutrition.dart';
import 'Screens/Users/register.dart';
import 'Data/spa.dart';
import 'Screens/profile.dart';
import 'Screens/welcomepage.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            path: 'register',
            builder: (BuildContext context, GoRouterState state) =>
                const Register(),
          ),
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) =>
                const Authpage(),
          ),
          GoRoute(
            path: 'loginAsAdmin',
            builder: (BuildContext context, GoRouterState state) =>
                const LoginAdmin(),
          ),
          GoRoute(
            path: 'toWelcome',
            builder: (BuildContext context, GoRouterState state) =>
                const FitnessApp(),
          ),
          GoRoute(
            path: 'profile',
            builder: (BuildContext context, GoRouterState state) =>
                const Profile(),
          ),
          GoRoute(
            path: 'ContactUs',
            builder: (BuildContext context, GoRouterState state) =>
                const ContactUs(),
          ),
          GoRoute(
            path: 'MySessions',
            builder: (BuildContext context, GoRouterState state) =>
                const MySessions(),
          ),
          GoRoute(
            path: 'Nutrition',
            builder: (BuildContext context, GoRouterState state) =>
                const Homepage(),
          ),
          GoRoute(
            path: 'WelcomePage',
            builder: (BuildContext context, GoRouterState state) =>
                const Welcomepage(),
          ),
          GoRoute(
            path: 'Spa',
            builder: (BuildContext context, GoRouterState state) => const spa(),
          ),
          GoRoute(
            path: 'Booking',
            builder: (BuildContext context, GoRouterState state) =>
                const Booking(),
          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const Welcomepage(),
      ),
    ],
  );
}
