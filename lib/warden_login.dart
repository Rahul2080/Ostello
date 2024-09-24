import 'dart:math';
// import 'package:cs/MatronHome.dart';
// import 'package:cs/rooms.dart';
// import 'package:cs/register.dart';
import 'package:cs/warden_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cs/matronregister.dart';
import 'package:flutter/material.dart';

bool _obscureText = true;

class Wardenlogin extends StatefulWidget {
  Wardenlogin({super.key});

  @override
  State<Wardenlogin> createState() => _WardenloginState();
}

class _WardenloginState extends State<Wardenlogin> {
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  void submit(BuildContext context) async {
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.text, password: pass.text);

      if (user.user == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Failed"),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login Successful"),
        ));
        Navigator.pushNamed(context, '/wardenHome');
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void forgotpassword(BuildContext context) async {
    try {
      if (email.text.isEmpty) {
        throw Exception("Email must not be empty");
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password reset email sent to your email")));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Warden Login"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: Color.fromARGB(255, 33, 54, 68),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        elevation: 70,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline_outlined),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.zero, bottom: Radius.zero),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 1,
                      ),
                    ),
                    label: Text("Email"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                child: TextField(
                  obscureText: _obscureText,
                  controller: pass,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.zero, bottom: Radius.zero),
                    ),
                    label: Text("Password"),
                    // maxLength: 6,
                    // obscureText: true,
                    // keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 20, left: 45),
                child: ElevatedButton(
                  onPressed: () {
                    submit(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 255, 236)),
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 33, 54, 68),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size(50, 40),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 40),
                child: TextButton(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 18,
                        )),
                        foregroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 33, 54, 68))),
                    onPressed: () {
                      forgotpassword(context);
                    },
                    child: Text('forgot password?')),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 190, right: 20, left: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context as BuildContext).push(
                        MaterialPageRoute(builder: (ctx) => wardenRegister()));
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 255, 236)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 33, 54, 68)),
                    minimumSize: MaterialStateProperty.all(
                      Size(50, 40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
