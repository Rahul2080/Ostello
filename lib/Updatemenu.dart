import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateMenu extends StatefulWidget {
  const UpdateMenu({super.key});

  @override
  State<UpdateMenu> createState() => _UpdateMenuState();
}

class _UpdateMenuState extends State<UpdateMenu> {

  final CollectionReference a =
      FirebaseFirestore.instance.collection('add_mess_menu');
  TextEditingController Breakfast = TextEditingController();
  TextEditingController Lunch = TextEditingController();
  TextEditingController Snack = TextEditingController();
  TextEditingController Dinner = TextEditingController();


  void updateUser(docId) {
    final data = {
       'Breakfast': Breakfast.text,
      'Lunch': Lunch.text,
      'Snack': Snack.text,
      'Dinner': Dinner.text,
      // 'Name': Name.text,
      // 'Email': Email.text,
      // 'Mobile': Mob.text,
      // 'Password': Password.text,
    };
    a.doc(docId).update(data).then((value) => Navigator.pop(context));
  }
  // void submit() async {
  //   try {.
  //     var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: Email.text, password: Password.text);
  //     if (user.user == null) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text("Registration Failed"),
  //       ));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text("Registration Successful"),
  //       ));
  //       Navigator.pushNamed(context, '/login');
  //     }

  //     final DocumentReference reg =
  //         FirebaseFirestore.instance.collection('authreg').doc(user.user?.uid);

  //     var reslt = await reg.get();
  //     if (reslt.exists) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('User aldready exist,Please login!')));
  //     }

  //     final data = {
  //       'Name': Name.text,
  //       'Email': Email.text,
  //       'Mobile': Mob.text,
  //       'Password': Password.text,
  //       'uid': user.user?.uid,
  //     };
  //     reg.set(data);
  //   } catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(e.toString())));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    Breakfast.text = args['Breakfast'];
    Lunch.text = args['Lunch'];
    Snack.text = args['Snack'];

    Dinner.text = args['Dinner'];
    final docId = args['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
        leading: Icon(Icons.home,color: Color.fromARGB(255, 255, 255, 236),),
        // actions: [
        //   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        //   IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        // ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(1))),
        elevation: 15,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: Breakfast,


          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
        label: Text("Breakfast"),
        ),
        
        
        
        ),
      ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
          controller: Lunch,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("Lunch"),
             ),
             ),
       ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: Snack ,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
          label: Text("Snack "),
        ),
        ),
      ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
           controller: Dinner,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("Dinner"),
             ),
             ),
       ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text('Name'),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
            //   child: TextField(
            //     controller: Name,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(), hintText: 'Enter Your Name'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text('Email'),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
            //   child: TextField(
            //     controller: Email,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         hintText: 'Enter Email Address'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text('Mobile'),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
            //   child: TextField(
            //     controller: Mob,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         hintText: 'Enter Mobile Number'),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text('Password'),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
            //   child: TextField(
            //     controller: Password,
            //     obscureText: true,
            //     maxLength: 6,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(), hintText: 'Enter Password'),
            //   ),
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 15),
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            left: 30, right: 30, top: 10, bottom: 10)),
                        foregroundColor:
                            MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 236)),
                        backgroundColor:
                            MaterialStateProperty.all(const Color.fromARGB(255, 33, 54, 68)),
                        // minimumSize: MaterialStateProperty.all(Size(100, 40)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 20,
                        ))),
                    onPressed: () {
                      // submit();
                      updateUser(docId);
                    },
                    child: Text("Update",style: TextStyle(color: Color.fromARGB(255, 255, 255, 236)),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
