import 'package:flutter/material.dart';
import 'package:yarab/services/profileServices.dart';
import '../../models/Users/profileModel.dart';
import '../../models/Users/usermodel.dart';
import '../../services/registerusers.dart';
import '../welcomepage.dart';
import 'edit_name.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: PreferredSize(
      preferredSize: Size.fromHeight(200.0),

      //preferredSize: Size.fromWidth(200.0),
    child: AppBar(

        title: Image.asset('images/profileimage.jpg', fit: BoxFit.cover ),
          toolbarHeight: 200,
          leadingWidth: 20,
          
         
        backgroundColor: Colors.black

        ),
      ),
      body: StreamBuilder<List<Profile>>(
        stream: readProfile(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final allProfiles = snapshot.data!;
            return Container(
              color: Color.fromARGB(232, 249, 249, 249),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                     child:Column(
                        children: <Widget>[
                          CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profilee.jpg'),
                
              ),
              Text(
                (allProfiles[index].name),
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
              Text(
                'Profile'.toUpperCase(),
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'SourceSansPro',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.black,
                ),
              ),
               InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.sports_gymnastics,
                      color: Colors.pink,
                    ),
                    title:Text(
                      (allProfiles[index].name),
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProfilePage(currentUserId: '',)));
                  
                }
              ),
              InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.pink,
                    ),
                    title: Text(
                      (allProfiles[index].mobile),
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),

                ),
              ),
              InkWell(
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.pink,
                    ),
                    title:Text(
                      (allProfiles[index].email),
                      style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
                
              ),
              
                          // Center(
                          //   child: Text('Name: '),
                          //   ),
                          //     Text(allProfiles[index].name),

                          // Center(
                          //   child: Text('Email: '),
                          //   ),
                          //     Text(allProfiles[index].email),

                          //  Center(
                          //    child: Text('Mobile: '),
                          // ),
                          // Text(allProfiles[index].mobile),
                        ],
                      )
                  
                  );
 
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
    ),
  
    );
  }
}
