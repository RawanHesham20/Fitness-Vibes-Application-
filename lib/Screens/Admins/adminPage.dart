//..
import 'package:flutter/material.dart';
import 'package:yarab/Screens/Admins/addclass.dart';
import 'package:yarab/Data/allUsers.dart';
import 'package:yarab/Screens/Users/login.dart';
import 'package:yarab/Screens/profile.dart';
import 'package:yarab/Screens/welcomepage.dart';
import 'package:yarab/Screens/Admins/drawer_admin.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});
  @override
  State<AdminPage> createState() => _AdminPage();
}

class _AdminPage extends State<AdminPage> {
  Widget build(BuildContext context) {
    //context is an object of a type BuildContext
    return Scaffold(
        drawer: Drawerr(),
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
                    'https://play-lh.googleusercontent.com/JN2eBGwf43lXD29owa2iyK3YgflO9RtjmBsmNJCmKeUkWsu7MXy-CVu3qVrTO2-pJueg=-rw',
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
                  ),
                  preferredSize: Size.fromHeight(80.0),
                ),
              ),
            ];
          },
          //build the app body

          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Admin",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        child: Text('Add Class'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          minimumSize: Size(30, 43),
                          textStyle: const TextStyle(
                            color: Colors.purple,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Addclass()),
                          );
                        },
                      ),
                      ElevatedButton(
                        child: Text('View and '
                            'Cancelled Classes'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          minimumSize: Size(30, 43),
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AllUsers()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )); //base set up to turn the combination widgets into a real app
  }
}
