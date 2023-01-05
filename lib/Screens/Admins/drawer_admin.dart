import 'package:flutter/material.dart';

import '../profile.dart';
import '../welcomepage.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({super.key});
  @override
  State<Drawerr> createState() => _Drawerr();
}
class _Drawerr extends State<Drawerr> {

  Widget build(BuildContext context) {
    //context is an object of a type BuildContext
    return Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF9340BA),
              ),
              accountName: Text("Admin",
                  style: TextStyle(fontSize: 21, fontFamily: 'Poppins')),
              accountEmail: Text(''),),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home', style: TextStyle(fontSize: 17)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Drawerr()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Profile', style: TextStyle(fontSize: 17)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: const Text('Logout', style: TextStyle(fontSize: 17)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Welcomepage()),
                );
              },
            )
          ],
        ),
      );
  }
}