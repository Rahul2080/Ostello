import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:cs/Add_expense.dart';

class Remove_student extends StatefulWidget {
  const Remove_student({super.key});

  @override
  State<Remove_student> createState() => _Remove_studentState();
}

class _Remove_studentState extends State<Remove_student> {
  final CollectionReference reg =
      FirebaseFirestore.instance.collection('register');

  void deletestudents(docId) {
    reg.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Student Details"),
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
        stream: reg.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot regsnap = snapshot.data.docs[index];
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
                        Padding(
                            padding: const EdgeInsets.only(
                                top: 16, bottom: 20, right: 4),
                            child: Container(
                                child: CircleAvatar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 33, 54, 68),
                                    radius: 50,
                                    child: Text(
                                      regsnap['Name'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 236)),
                                    )))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("address:  "),
                                  //Text(medicsnap['Name']),
                                  Text(
                                    regsnap['address'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("admnumber:  "),
                                  Text(
                                    regsnap['admnumber'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ]),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("course:  "),
                                  Text(
                                    regsnap['course'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ]),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("phone:  "),
                                  Text(
                                    regsnap['phone'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("email:  "),
                                  Text(
                                    regsnap['email'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("course:  "),
                                  Text(
                                    regsnap['course'].toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ])

                            //Text(medicsnap['Email']),
                          ],
                        ),
                        Row(
                          children: [
                            // IconButton(
                            //   onPressed: () {

                            //     Navigator.pushNamed(context, '/updateExpense',
                            //         arguments: {
                            //           'Date': messsnap['Date'],
                            //           'Category': messsnap['Category'].toString(),
                            //           'Expense_amnt': messsnap['Expense_amnt'].toString(),
                            //           'Quantity': messsnap['Quantity'].toString(),
                            //           'id': messsnap.id,
                            //         });
                            //   },
                            //   icon: Icon(Icons.edit),
                            //   iconSize: 30,
                            //   color: const Color.fromARGB(255, 33, 54, 68),
                            // ),

                            IconButton(
                              onPressed: () {
                                deletestudents(regsnap.id);
                              },
                              icon: Icon(Icons.delete),
                              iconSize: 30,
                              color: const Color.fromARGB(255, 33, 54, 68),
                            ),
                          ],
                        ),
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
