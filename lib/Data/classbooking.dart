import 'package:flutter/material.dart';
import 'package:yarab/Screens/Users/contactUs.dart';
import 'package:yarab/Screens/Users/fitnessApp.dart';
import 'package:yarab/Screens/Users/bookTile.dart';
import 'package:yarab/Screens/profile.dart';
import 'package:yarab/Screens/welcomepage.dart';

import '../Screens/Users/drawer_user.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => classbooking();
}

class classbooking extends State<Booking> {
  bool _isFavorited = true;
  // int _favoriteCount = 20;

  int _boxcount = 20;
  int _flexcount = 15;
  int _zumbacount = 20;
  int _bodycount = 20;
  void incerementcounter() {
    setState(() {
      if (_isFavorited) {
        _boxcount -= 1;
        _isFavorited = false;
      } else {
        _boxcount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9340BA),
        title: Text('Class Booking'),
        centerTitle: true,
      ),
      drawer: draweruser(),
      body: Column(
        children: [
          Book_Tile(
            Instructor: "Mariam",
            classname: "Boxing Class",
            Duration: "09:00 am-10:00 am (60min)",
            // Spots: '$_boxcount' " Spots left",
          ),
          Book_Tile(
            Instructor: "Nesma",
            classname: "Flexibility",
            Duration: "09:00 am-10:00 am (60min)",
            // Spots: '$_flexcount' "Spots left",
          ),
          Book_Tile(
            Instructor: "Shimo",
            classname: "Zumba",
            Duration: "09:00 am-10:00 am (60min)",
            // Spots: "13 Spots left",
          ),
          Book_Tile(
            Instructor: "Sara",
            classname: "Body Pump",
            Duration: "09:00 am-10:00 am (60min)",
            //  Spots: "9 Spots left",
          ),
        ],
      ),
    );
  }
}

