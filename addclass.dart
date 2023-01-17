import 'package:flutter/material.dart';
import 'package:yarab/Screens/Admins/drawer_admin.dart';
import 'package:yarab/Screens/profile.dart';
import 'package:yarab/Screens/Admins/adminPage.dart';
import 'package:yarab/Screens/welcomepage.dart';

import '../../services/classesServices.dart';

class Addclass extends StatefulWidget {
  const Addclass({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<Addclass> {
  GlobalKey<FormState> thekey = GlobalKey<FormState>();

  final classnameController = TextEditingController();
  final instructorController = TextEditingController();
  final durationController = TextEditingController();
  final noslotsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF9340BA),
          title: Text('Add a new class'),
          centerTitle: true,
        ),
        drawer: Drawerr(),
        body: Stack(
          children: [
            Image.asset(
              'images/soora.PNG',
              height: 781,
              width: 400,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(left: 35, top: 60),
              child: const Text(
                'Add\nClasses',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        key: thekey,
                        children: [
                          TextFormField(
                            controller: classnameController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Class name",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: instructorController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: " Instructor",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: durationController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Duration",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: noslotsController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "No.of slots ",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 40),
                              child: ElevatedButton(
                                child: Text('Add'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.purple,
                                  minimumSize: Size(180, 43),
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 29,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  final String newClass =
                                      classnameController.text;
                                  final String newInstructor =
                                      instructorController.text;
                                  final String newDuration =
                                      durationController.text;
                                   int newSlots =
                                      int.parse(noslotsController.text);
                                  ClassesDb(
                                      classname: newClass,
                                      instructorname: newInstructor,
                                      duration: newDuration,
                                      noOfSlots: newSlots);
                                  showDialog(
                                      context: context,
                                      builder: (context) => const Center(
                                            child: CircularProgressIndicator(),
                                          ));
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminPage()),
                                  );
                                },
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
