import 'package:flutter/material.dart';
import 'package:yarab/Screens/Admins/drawer_admin.dart';
import 'package:yarab/services/PTServices.dart';
import 'package:yarab/Screens/Admins/adminPage.dart';

class AddPT extends StatefulWidget {
  const AddPT({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}
class _MyRegisterState extends State<AddPT> {
  GlobalKey<FormState> thekey =GlobalKey<FormState>();

 final trainernameController = TextEditingController();
 final availabledaysController = TextEditingController();
 final ageController=TextEditingController();
  final PhoneController =TextEditingController();
   final EmailController=TextEditingController();
  final sessiondurationController = TextEditingController();
   //TimeOfDay endTime=TimeOfDay(hour: 12, minute: 30);
  bool _isSunChecked = false;
  bool _ismonChecked = false;
  bool _istuesChecked = false;
  bool _iswedChecked = false;
  bool _isthursChecked = false;
  bool _isfriChecked = false;
  bool _issatChecked = false;
// Map<String,bool?> availabledays = {
//     'Sunday':true,
//     'Monday':true,
//     'Tuesday':true,
//     'Wednesday':true,
//     'Thursday':true,
//  'Friday':true,
//   'Saturday':true,
  
// };

  var children; 

  @override
  Widget build(BuildContext context) {

   Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;}
    return Container(
        child: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color(0xFF9340BA),
            title: Text('Add a new Personal Trainer'),
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
                            controller: trainernameController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Trainer Name",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),)),),
                          const SizedBox(height: 40,),

                          TextFormField(
                            controller: PhoneController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Phone Number",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),)),),
                          const SizedBox(height: 40,),

                        TextFormField(
                            controller: EmailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),)),),
                          const SizedBox(height: 40,),

                          TextFormField(
                            controller: ageController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: " Age",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),)),),
                          const SizedBox(height: 40,),


                          TextFormField(
                            controller: availabledaysController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Your Dayoff",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),)),),
                          const SizedBox(height: 40,),

                          //  Text("Available days",
                          //  style: TextStyle(fontFamily: 'OoohBaby', fontSize: 30, color:Colors.white,)),
                          //  Text("Choose at least 4 days",
                          //  style: TextStyle(fontFamily: 'OoohBaby', fontSize: 15, color:Colors.white,)),

                        //   CheckboxListTile(
                        //       title: const Text('Sunday' ,  style: TextStyle( color:Colors.white,)),
                        //           checkColor: Colors.white,
                        //           tileColor: Colors.white,
                        //           value: _isSunChecked,
                        //           onChanged: (bool? value) {
                        //             setState(() {
                        //           _isSunChecked = value!;
                        //             });
                        //           },
                        //             ),
                        //   CheckboxListTile(
                        //         title: const Text("Monday",   style: TextStyle( color:Colors.white,)),
                        //          checkColor: Colors.white,
                        //         tileColor: Colors.white,
                        //         value: _ismonChecked,
                        //         onChanged: (bool? value) {
                        //           setState(() {
                        //         _ismonChecked = value!;
                        //           });
                        //         },
                        //           ),
                        //   CheckboxListTile(
                        //           title: const Text("tuesday",style: TextStyle( color:Colors.white,)),
                        //             checkColor: Colors.white,
                        //             tileColor: Colors.white,
                        //             value: _istuesChecked,
                        //             onChanged: (bool? value) {
                        //               setState(() {
                        //             _istuesChecked = value!;
                        //               });
                        //             },
                        //               ),
                        //   CheckboxListTile(
                        //            title: const Text("Wednesday",style: TextStyle( color:Colors.white,)),
                        //             checkColor: Colors.white,
                        //             tileColor: Colors.white,
                        //             value: _iswedChecked,
                        //             onChanged: (bool? value) {
                        //               setState(() {
                        //             _iswedChecked = value!;
                        //               });
                        //             },
                        //               ),
                        // CheckboxListTile(
                        //               title: const Text("thursday",style: TextStyle( color:Colors.white,)),
                        //                checkColor: Colors.white,
                        //               tileColor: Colors.white,
                        //               value: _isthursChecked,
                        //               onChanged: (bool? value) {
                        //                 setState(() {
                        //               _isthursChecked = value!;
                        //                 });
                        //               },
                        //                 ),
                        // CheckboxListTile(
                        //               title: const Text("friday",style: TextStyle( color:Colors.white,)),
                        //                   checkColor: Colors.white,
                        //               tileColor: Colors.white,
                        //               value: _isfriChecked,
                        //               onChanged: (bool? value) {
                        //                 setState(() {
                        //               _isfriChecked = value!;
                        //                 });
                        //               },
                        //                 ),
                        // CheckboxListTile(
                        //               title: const Text("saturday",style: TextStyle( color:Colors.white,)),
                        //                   checkColor: Colors.white,
                        //               tileColor: Colors.white,
                        //               value: _issatChecked,
                        //               onChanged: (bool? value) {
                        //                 setState(() {
                        //               _issatChecked = value!;
                        //                 });
                        //               },
                        //                 ),


                        //   const SizedBox(height: 40,),

                          TextFormField(
                                 controller: sessiondurationController,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Session Duration",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple, width: 3.0),
                                  borderRadius: BorderRadius.circular(2),)),),
                          const SizedBox(height: 40,),

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
                                  final String newTrainer =
                                            trainernameController.text;
                                  final String Age= ageController.text;
                                  final String PhoneNumber= PhoneController.text;
                                  final String Email= EmailController.text;
                                        final String availabledays =
                                            availabledaysController.text;
                                        final String Duration =
                                            sessiondurationController.text;
                                        PTDb(
                                            trainername: newTrainer,
                                            age: Age,
                                            email: Email,
                                            phonenumber: PhoneNumber,
                                            availabledays: availabledays,
                                            sessionduration: Duration,); 
                                             showDialog(
                                            context: context,
                                         builder: (context) => const Center(
                                        child: CircularProgressIndicator(),
                                       ));
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AdminPage()),
                                          );
                                },
                              )
                          ),
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
