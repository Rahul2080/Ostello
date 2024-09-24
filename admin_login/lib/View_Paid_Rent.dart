import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class View_Paid_Rent extends StatefulWidget {
  const View_Paid_Rent({super.key});

  @override
  State<View_Paid_Rent> createState() => _View_Paid_RentState();
}

class _View_Paid_RentState extends State<View_Paid_Rent> {
  final CollectionReference hostelpay =
      FirebaseFirestore.instance.collection('pay_hostelrent');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Paid Hostel Rent Details"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      ),

//floating action button

      //  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/addExpense');
      //   },
      //   backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      //   mini: false,
      //   tooltip: 'Share File',
      //   child: Icon(Icons.add,color:Color.fromARGB(255, 255, 255, 236) ,),
      // ),

      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      body: StreamBuilder(
        stream: hostelpay.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot hostelpaysnap =
                    snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 4, right: 1, left: 1),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 5, spreadRadius: 0),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Padding(
                        //     padding: const EdgeInsets.only(
                        //         top: 16, bottom: 20, right: 4),
                        //     child: Container(
                        //         child: CircleAvatar(
                        //             backgroundColor:
                        //                 const Color.fromARGB(255, 33, 54, 68),
                        //             radius: 50,
                        //             child: Text(
                        //               hostelpaysnap['email'],
                        //               style: TextStyle(
                        //                   fontSize: 20,
                        //                   color: const Color.fromARGB(
                        //                       255, 255, 255, 236)),
                        //             )))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Email:  "),
                                  //Text(medicsnap['Name']),
                                  Text(
                                    hostelpaysnap['email'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Date:  "),
                                  Text(
                                    hostelpaysnap['Date'],
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ]),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Amount:  "),
                                  Text(
                                    hostelpaysnap['Amount'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ]),

                            // Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text("phone:  "),
                            //       Text(
                            //         regsnap['phone'].toString(),
                            //         style: TextStyle(
                            //           fontSize: 18,
                            //         ),
                            //       )
                            //     ]),
                            // Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text("email:  "),
                            //       Text(
                            //         regsnap['email'].toString(),
                            //         style: TextStyle(
                            //           fontSize: 18,
                            //         ),
                            //       )
                            //     ]),
                            // Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Text("course:  "),
                            //       Text(
                            //         regsnap['course'].toString(),
                            //         style: TextStyle(
                            //           fontSize: 18,
                            //         ),
                            //       )
                            //     ])

                            //Text(medicsnap['Email']),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     // IconButton(
                        //     //   onPressed: () {

                        //     //     Navigator.pushNamed(context, '/updateExpense',
                        //     //         arguments: {
                        //     //           'Date': messsnap['Date'],
                        //     //           'Category': messsnap['Category'].toString(),
                        //     //           'Expense_amnt': messsnap['Expense_amnt'].toString(),
                        //     //           'Quantity': messsnap['Quantity'].toString(),
                        //     //           'id': messsnap.id,
                        //     //         });
                        //     //   },
                        //     //   icon: Icon(Icons.edit),
                        //     //   iconSize: 30,
                        //     //   color: const Color.fromARGB(255, 33, 54, 68),
                        //     // ),

                        //     IconButton(
                        //       onPressed: () {
                        //         deletestudents(regsnap.id);
                        //       },
                        //       icon: Icon(Icons.delete),
                        //       iconSize: 30,
                        //       color: const Color.fromARGB(255, 33, 54, 68),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
