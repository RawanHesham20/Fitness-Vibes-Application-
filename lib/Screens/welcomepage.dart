import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yarab/Screens/Users/login.dart';
import 'package:yarab/Screens/Users/register.dart';
import 'package:yarab/Screens/Admins/loginAdmin.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF351339),
        body: ListView(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(120),
                  child: Image(
                    image: new AssetImage('images/sora.PNG'),
                    height: 781,
                    width: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 650.0, right: 0),
                  child: const Text(
                    'VIBES GYM',
                    style: TextStyle(
                        color: Color(0xF2CAADCC),
                        shadows: [
                          Shadow(
                              color: Colors.black38,
                              offset: Offset(3, 3),
                              blurRadius: 2)
                        ],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontSize: 50.0),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 60, 10, 130),
                    child: ElevatedButton(
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFCAADCC),
                        minimumSize: Size(180, 43),
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        GoRouter.of(context).go('/login');
                      },
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 60, 10, 190),
                    child: ElevatedButton(
                      child: Text('Register'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFCAADCC),
                        minimumSize: Size(180, 43),
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        GoRouter.of(context).go('/register');
                      },
                    )),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 60, 10, 70),
                    child: ElevatedButton(
                      child: Text('Login as an admin?'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: Size(80, 2),
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        GoRouter.of(context).go('/loginAsAdmin');
                      },
                    )),
              ],
            ),
          ], //<Widget>[]
        ), //Column
      ), //Center
    );
  }
}
