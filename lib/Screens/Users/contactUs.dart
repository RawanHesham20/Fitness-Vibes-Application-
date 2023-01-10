import 'package:flutter/material.dart';
import 'package:yarab/Screens/Users/fitnessApp.dart';
import 'package:yarab/Screens/profile.dart';
import 'package:yarab/Data/mySessions.dart';
import 'package:yarab/Screens/welcomepage.dart';

import 'drawer_user.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUs createState() => _ContactUs();
}

class _ContactUs extends State<ContactUs> {
  GlobalKey<FormState> Thekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9340BA),
        title: Text('Vibes Gym'),
        centerTitle: true,
      ),
      drawer: draweruser(),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            textAlign: TextAlign.start,
            ' Contact Us',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.purple,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                child: Text('VibesGym@gmail.com'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  minimumSize: Size(300, 50),
                  textStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                child: Text('01090015134'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  minimumSize: Size(300, 50),
                  textStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                child: Text(
                    'You can come and visit us everyday from 9:00 am to 10:00 pm '),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  minimumSize: Size(400, 90),
                  textStyle: const TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {}),
          ),
        ]),
      ),
    );
  }
}
