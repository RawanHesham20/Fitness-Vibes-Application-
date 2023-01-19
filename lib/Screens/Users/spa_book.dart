import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:yarab/services/registerusers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../models/Users/spamodel.dart';
import '../../models/Users/usermodel.dart';
import '../../services/bookspaService.dart';
import '../Admins/adminPage.dart';
import 'drawer_user.dart';

class spa_book extends StatefulWidget {
  const spa_book({Key? key}) : super(key: key);

  @override
  _bookspaState createState() => _bookspaState();

  // List<DropdownMenuItem<String>> get dropdownItems {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     DropdownMenuItem(child: Text("USA"), value: "USA"),
  //     DropdownMenuItem(child: Text("Canada"), value: "Canada"),
  //     DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
  //     DropdownMenuItem(child: Text("England"), value: "England"),
  //   ];
  //   return menuItems;
  // }

}

class _bookspaState extends State<spa_book> {
  GlobalKey<FormState> Thekey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final packagenameController = TextEditingController();
  final DateTimeController = TextEditingController();
  _bookspaState() {
    _selectedVal = _PackageName[0];
  }
  final _PackageName = [
    'Friends Package',
    'Bridal Package',
    'Massage Package 1',
    'Relax package',
  ];
  //bookSpa
  String? _selectedVal = '';
  DateTime dateTime = DateTime(2022, 27, 1, 5, 30);
  Future bookSpa(book) async {
    // try {
    // UserCredential authusers =
    //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: emailController.text,
    //   password: passwordController.text,
    // );
    // User? userabc = authusers.user;
    // final db = FirebaseFirestore.instance.collection("BookSpa");
    // userx.role = "User";
    // userx.id = userabc!.uid;
    //  final json = userx.toJson();
    //   await db.set(json);
    // } on FirebaseAuthException catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');

    return Container(
      child: Scaffold(
         drawer: draweruser(),
        appBar: AppBar(
          backgroundColor: Colors.purple,
          flexibleSpace: const Image(
            image: AssetImage('images/shutterstock_1447852889-1-1-800x534.jpg'),
            fit: BoxFit.cover,
            width: 250.00,
          ),
          toolbarHeight: 150,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: const Text(
                'Book Spa',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 33,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.16),
                child: Form(
                  key: Thekey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            DropdownButtonFormField(
                              //  onTap()=>controller:packagenameController,
                              // Controller:

                              value: _selectedVal,
                              items: _PackageName.map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  )).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selectedVal = val;
                                });
                                controller:
                                packagenameController;
                              },

                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.purple, width: 3.0),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  labelText: 'Choose Package'),
                              iconEnabledColor: Colors.purple,
                            ),
                            //  StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection),
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: nameController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Full Name",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.purple, width: 3.0),
                                    borderRadius: BorderRadius.circular(2),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Full Name';
                                } else if (value.length < 7) {
                                  return 'Enter at least 7 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: mobileController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Mobile number",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.purple, width: 3.0),
                                    borderRadius: BorderRadius.circular(2),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Mobile Number';
                                } else if (!RegExp(r'^01[0125][0-9]{8}$')
                                    .hasMatch(value)) {
                                  return ('please enter a valid mobile number that contains only 11 numbers ');
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ElevatedButton(
                              child: Text(
                                  '${dateTime.year}/${dateTime.month}/${dateTime.day}  ${dateTime.hour}:${dateTime.minute}'),
                              onPressed: () async {
                                final date = await pickDate();
                                final time = await pickTime();
                                if (date == null) return;
                                if (time == null) return;
                                final newDateTime = DateTime(
                                    date.year,
                                    date.month,
                                    date.day,
                                    time.hour,
                                    time.minute);
                                setState(() {
                                  dateTime = newDateTime;
                                });
//  DateTime selectedDT=dateTime;
// FirebaseFirestore.instance.collection('BookedSpa').doc.SetData({
// 'date_time': selectedDT
//  });
                                // controller:
                                // DateTimeController;
                              },
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                              controller: emailController,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Email or contact info",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.purple, width: 3.0),
                                    borderRadius: BorderRadius.circular(2),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Email';
                                } else if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ('please enter a valid email');
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 10, 10, 40),
                                child: ElevatedButton.icon(
                                  // child: Text('Add'),

                                  label: Text('BOOK'),
                                  icon: const Icon(
                                    Icons.spa_rounded,
                                  ),

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    padding: EdgeInsets.all(20),
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 29,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    final String name = nameController.text;
                                    final String newmobile =
                                        mobileController.text;
                                    final String newEmail =
                                        emailController.text;
                                    final DT = DateTime.now();
                                    final TextEditingValue packageName =
                                        packagenameController.value;
                                    
                                    // int newSlots =
                                    //   int.parse(noslotsController.text);
                                    SpaDb(
                                      //packagename:,
                                      Name: name,
                                      Mobile: newmobile,
                                      Email: newEmail,
                                      PackageName: packageName.toString(),
                                      DT:DT,

                                      //  Packagename:packagenameController.value.toString().trim();
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => spa_book()),
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
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2023),
      lastDate: DateTime(2055));

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: (12), minute: dateTime.minute),
      );

  // BookSpa(
  //   {required String name, required String mobile, required String email}) {}
}
