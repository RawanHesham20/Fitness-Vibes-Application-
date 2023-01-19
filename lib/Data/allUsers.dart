import 'package:flutter/material.dart';
import 'package:yarab/Screens/Admins/drawer_admin.dart';
import 'package:yarab/Screens/Admins/viewUsers.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsers();
}
class _AllUsers extends State<AllUsers> {
  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF9340BA),
        title: Text('Booked Users'),
        centerTitle: true,
      ),
      drawer: Drawerr(),
      body: Column(children: const [
        ViewUsers(
          ClassName: "Boxing Class",
          Duration: "09:00 am-10:00 am" ,
          BookedSpots: "10 Booked Spots ",
        ),
        ViewUsers(
          ClassName: "Flexibility",
          Duration: "09:00 am-10:00 am" ,
          BookedSpots: "20 Booked Spots ",
        ),
        ViewUsers(
          ClassName: "Zumba",
          Duration: "09:00 am-10:00 am" ,
          BookedSpots: "5 Booked Spots ",
        ),

      ],
      ),

    );
  }
}

