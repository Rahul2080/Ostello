import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateExpense extends StatefulWidget {
  const UpdateExpense({super.key});

  @override
  State<UpdateExpense> createState() => _UpdateExpenseState();
}

class _UpdateExpenseState extends State<UpdateExpense> {

  final CollectionReference a =
      FirebaseFirestore.instance.collection('Rooms');
  TextEditingController Date = TextEditingController();
  TextEditingController Category = TextEditingController();
  TextEditingController Expense_amnt= TextEditingController();
  TextEditingController Quantity= TextEditingController();


  void updateUser(docId) {
    final data = {
       'Date': Date.text,
      'Category': Category.text,
      'Expense_amnt': Expense_amnt.text,
      'Quantity': Quantity .text,
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
    Date.text = args['Date'];
    Category.text = args['Category'];
    Expense_amnt.text = args['Expense_amnt'];

     Quantity.text = args['Quantity'];
    final docId = args['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
        leading: Icon(Icons.home),
        // actions: [
        //   IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        //   IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        // ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        elevation: 15,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: Date,


          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
        label: Text("Date"),
        ),
        
        
        
        ),
      ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
          controller: Category,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("Category"),
             ),
             ),
       ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: Expense_amnt,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
          label: Text("Expense_amnt"),
        ),
        ),
      ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
           controller: Quantity,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("Quantity "),
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
                            MaterialStateProperty.all(Colors.white),
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
                    child: Text("Update")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
