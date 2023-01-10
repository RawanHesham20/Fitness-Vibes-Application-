import 'package:flutter/material.dart';
import 'package:yarab/Screens/Admins/addclass.dart';
import 'package:yarab/Data/allUsers.dart';
import 'package:yarab/Screens/Users/login.dart';
import 'package:yarab/Screens/profile.dart';
import 'package:yarab/Screens/welcomepage.dart';
import 'package:yarab/Screens/Admins/drawer_admin.dart';
import 'FetchAllUsers.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});
  @override
  State<AdminPage> createState() => _AdminPage();
}
class _AdminPage extends State<AdminPage> {
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawerr(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled){
          return <Widget>[
            const SliverAppBar(
              expandedHeight: 300.0,
              pinned: true,
              floating: true,
              title: Text("Vibes Gym",
                style: TextStyle(color: Colors.white),),
              centerTitle: true,
              backgroundColor: Colors.black,
              toolbarHeight: 80.0,
               flexibleSpace: Image(
             image: AssetImage('images/instructorLogin.jpg'),
          fit: BoxFit.cover,
          width:250.00, ),
              bottom: PreferredSize(child:Padding(

                padding: EdgeInsets.only(
                    bottom: 34.0, left: 12.0, right: 12.0
                ),),
                preferredSize: Size.fromHeight(80.0),), ),];  },

            body: SingleChildScrollView(
             child: Padding(

            padding:
            const EdgeInsets.only(top: 20.0, right: 20.0,left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Admin",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                  ),),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: const Text('Add Class'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: const Size(30, 50),
                      ),
                    onPressed: (){ Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Addclass()),
                    );
                    }, ),
                    ElevatedButton(
                      child:  const Text('View Users'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: const Size(30, 50),
                      
                      ),
                      onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllUsersPage()),
                      );
                      },
                    ),
                     ElevatedButton(
                      child:  const Text('Cancel Classes'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: const Size(30, 50),
                      
                      ),
                      onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllUsersPage()),
                      );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )); 
  }
}
