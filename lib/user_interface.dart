import 'package:cs/login.dart';
import 'package:cs/matronlogin.dart';
import 'package:cs/warden_login.dart';
import 'package:cs/parent_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Userinterface extends StatefulWidget {
  const Userinterface({super.key});

  @override
  State<Userinterface> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Userinterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Interface"),
        foregroundColor: const Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
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
              // children: [
              //  Padding(
              //    padding: const EdgeInsets.only(left: 20,right: 20,top: 100),
              //    child: ElevatedButton(

              //     onPressed: () {
              //   //  Navigator.of(context).push(
              //   //                   MaterialPageRoute(builder: (ctx) => AddRooms()));
              //    },

              //    child: Text("Admin",style: TextStyle(fontSize: 20),
              //    ),
              //    style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 236)),
              //                   backgroundColor: MaterialStateProperty.all(
              //                       const Color.fromARGB(255, 33, 54, 68)),
              //                   minimumSize: MaterialStateProperty.all(Size(150, 50),
              //                   ),),
              //    ),
              //  ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 220),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) => login()));
                  },
                  child: Text(
                    "Student",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 236)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 33, 54, 68)),
                    minimumSize: MaterialStateProperty.all(
                      Size(150, 50),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => Matronlogin()));
                  },
                  child: Text(
                    "Matron",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 236)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 33, 54, 68)),
                    minimumSize: MaterialStateProperty.all(
                      Size(150, 50),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => Wardenlogin()));
                  },
                  child: Text(
                    "Warden",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 236)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 33, 54, 68)),
                    minimumSize: MaterialStateProperty.all(
                      Size(150, 50),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => ParentLogin()));
                  },
                  child: Text(
                    "Parent",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 255, 236)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 33, 54, 68)),
                    minimumSize: MaterialStateProperty.all(
                      Size(150, 50),
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
