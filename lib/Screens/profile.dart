import 'package:flutter/material.dart';
import 'package:yarab/Data/data.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}
class _MyRegisterState extends State<Profile> {
  GlobalKey<FormState> Thekey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
    appBar: PreferredSize(
     preferredSize: Size.fromHeight(200.0),

      //preferredSize: Size.fromWidth(200.0),
    child: AppBar(

        title: Image.asset('images/sora.PNG', fit: BoxFit.cover),
          toolbarHeight: 200,
        backgroundColor: Colors.black

        ),
    ),
         body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,



            children: [
              Center(
                child: Text('Vibes Gym'),
              ),
              Text(
                textAlign: TextAlign.center,
                ' Profile',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              for(int i = 0 ; i < Data.users.length ; i++)
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(Data.users[i][4].toString()),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical:0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 4,
                        color: Colors.white
                    ),
                    color: Colors.pinkAccent,
                  ),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),

                ),
              ),

              Column(
                children: [
                  for(int i = 0 ; i < Data.users.length ; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        child: Text(Data.users[i][1].toString()),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: Size(300, 50),
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {}
                    ),
                  ),
                  for(int i = 0 ; i < Data.users.length ; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        child: Text(Data.users[i][3].toString()),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: Size(300, 50),
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {}
                    ),
                  ),
                  for(int i = 0 ; i < Data.users.length ; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        child: Text(Data.users[i][2].toString()),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: Size(300, 50),
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {}
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        child: Text('Change Password '),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: Size(300, 50),
                          textStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {}
                    ),
                  ),

                ],
              ),
            ]

        ),

      ),
    );
  }
}