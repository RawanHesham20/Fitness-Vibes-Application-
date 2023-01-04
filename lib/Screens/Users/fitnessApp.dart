import 'package:flutter/material.dart';
import 'package:yarab/Screens/welcomepage.dart';
import 'package:yarab/Screens/profile.dart';
import 'package:yarab/Data/classbooking.dart';
import 'package:yarab/Screens/Users/spa.dart';
import 'package:yarab/Screens/Users/drawer_user.dart';
import 'package:yarab/fitnessapp_outline.dart';
import 'package:yarab/Screens/Users/contactUs.dart';
import 'package:yarab/Data/pt.dart';
import 'package:yarab/Data/mySessions.dart';

class FitnessApp extends StatefulWidget {
  const FitnessApp({super.key});
  @override
  State<FitnessApp> createState() => _FitnessAppState();
}

class _FitnessAppState extends State<FitnessApp> {
  List<String> trainingImage = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6ma1geMZ85CwNbdI6UiGVk6jql8sS0ENhxsmHh7N11Q9qZMu5ZHg5TKU0uedS0t3K1Eo&usqp=CAU",
    "https://naturatermospa.com/wp-content/uploads/2019/09/spa-768x512.jpg",
    "https://media.istockphoto.com/photos/young-woman-exercising-situps-with-assistance-of-female-friend-in-gym-picture-id696844742?k=20&m=696844742&s=612x612&w=0&h=LAJMCD47xsPe34YAcxsa2ULXxwWPP2o9U7H-CrZfay4=",
  ];

  Widget build(BuildContext context) {
    //context is an object of a type BuildContext

    return Scaffold(
      drawer: draweruser(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              pinned: true,
              floating: true,
              title: Text(
                "Vibes Gym",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
              toolbarHeight: 80.0,
              // leading: IconButton(
              //   onPressed: (){
              //
              //   },
              //   // icon: Icon(Icons.menu),
              // ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://media.istockphoto.com/photos/side-view-of-beautiful-muscular-woman-running-on-treadmill-picture-id1132086660?k=20&m=1132086660&s=612x612&w=0&h=UTXXsDbUuREHV0UwHThgI144yKyReetDYlIL5C6_JoI=',
                  fit: BoxFit.cover,
                  //to make it darker
                  color: Color(0xaa212121),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              //add the bottom serach bar
              bottom: PreferredSize(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 34.0, left: 12.0, right: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 24.0),
                        hintText: "Search for a training Program...",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.purple,
                        )),
                  ),
                ),
                preferredSize: Size.fromHeight(80.0),
              ),
            ),
          ];
        },
        //build the app body

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Top Trends",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                //create the list Item widget
                listItem(trainingImage[0], "classes", 4, 30),
                listItem(trainingImage[1], "Spa", 4, 30),
                listItem(trainingImage[2], "Private Trainer", 4, 59),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      child: Text('Spa'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        minimumSize: Size(30, 43),
                        textStyle: const TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const spa()),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: Text('Classes'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        minimumSize: Size(30, 43),
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Booking()),
                        );
                      },
                    ),
                    ElevatedButton(
                      child: Text('PT'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        minimumSize: Size(30, 43),
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const bookpt()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ); //base set up to turn the combination widgets into a real app
  }
}

