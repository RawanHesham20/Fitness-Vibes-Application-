import 'package:flutter/material.dart';
import 'package:yarab/Screens/Users/register.dart';
import 'package:yarab/Screens/Users/fitnessApp.dart';
import 'package:go_router/go_router.dart';

class myLogin extends StatefulWidget {
  const myLogin({super.key});

  @override
  State<myLogin> createState() => Login();
}

class Login extends State<myLogin> {
  final Thekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        flexibleSpace: const Image(
          image: AssetImage('images/login.jpeg'),
          fit: BoxFit.cover,
          width: 250.00,
        ),
        toolbarHeight: 150,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF9340BA),
              ),
              accountName: Text("VIBES GYM",
                  style: TextStyle(fontSize: 21, fontFamily: 'Poppins')),
              accountEmail: Text(''),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: const Text('Home', style: TextStyle(fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Profile', style: TextStyle(fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: const Text('Logout', style: TextStyle(fontSize: 17)),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 35, top: 40),
            child: const Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 35, right: 35, top: 150),
              child: Form(
                key: Thekey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 3.0),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 3.0),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      child: Text('Forgot Password?'),
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {},
                    ),

                    ElevatedButton(
                        child: Text('LOGIN'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF9340BA),
                          minimumSize: Size(200, 50),
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          final form = Thekey.currentState;
                          if (form!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FitnessApp()),
                            );
                            // context.go('fitness');
                          }
                        }),

                    TextButton(
                      child: Text('Don’t have an account? Register!'),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(10, 115, 20, 20),
                        textStyle: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        foregroundColor: Colors.deepOrange,
                      ),
                      onPressed: () => {
                        // context.go('/Page2')
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()),
                        )
                      },
                    )
                    // const Padding(
                    //   padding: EdgeInsets.fromLTRB(10, 70, 20, 20), //apply padding to all four sides
                    //   child: Text("Don’t have an account?"),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
