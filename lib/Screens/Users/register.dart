import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yarab/services/registerusers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/firebaseAuthMethod.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<Register> {
  GlobalKey<FormState> Thekey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  
  Future signUp(Users userx) async {
    try {
      UserCredential authusers =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? userabc = authusers.user;
      final db =
          FirebaseFirestore.instance.collection("users").doc(userabc?.uid);
      userx.role = "User";
      userx.id = userabc!.uid;
      final json = userx.toJson();
      await db.set(json);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          flexibleSpace: const Image(
            image: AssetImage('images/login.jpeg'),
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
                'Create\nAccount',
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
                                }
                                else if (value.length < 7) {
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
                                }
                                else if (!RegExp(r'^01[0125][0-9]{8}$')
                                    .hasMatch(value)) {
                                  return ('please enter a valid mobile number that contains only 11 numbers ');
                                }
                                return null;
                              },
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
                                }
                               else if (!RegExp(
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
                            TextFormField(
                              controller: passwordController,
                              style: const TextStyle(color: Colors.black),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: "Password",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.purple, width: 3.0),
                                    borderRadius: BorderRadius.circular(2),
                                  )),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Password';
                                }
                                else if (value.length < 7) {
                                  return 'Password must be at least 7 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.purple,
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        final usery = Users(
                                          name: nameController.text.trim(),
                                          mobile: mobileController.text.trim(),
                                          email: emailController.text.trim(),
                                        );
                                        if (Thekey.currentState!.validate()) {
                                          Thekey.currentState!.save();
                                          signUp(usery);
                                          GoRouter.of(context).go('/login');
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
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
}
