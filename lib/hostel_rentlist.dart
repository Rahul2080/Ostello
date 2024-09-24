import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:cs/Add_expense.dart';s

class Hostel_rentlist extends StatefulWidget {
  const Hostel_rentlist({super.key});

  @override
  State<Hostel_rentlist> createState() => _Hostel_rentlistState();
}

class _Hostel_rentlistState extends State<Hostel_rentlist> {
  final CollectionReference Rent =
      FirebaseFirestore.instance.collection('Hostel_Rent');

  void deleteExpense(docId) {
    Rent.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hostel Rent"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      ),

//floating action button

      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/addRent');
      //   },
      //   backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      //   mini: false,
      //   tooltip: 'Share File',
      //   child: Icon(
      //     Icons.add,
      //     color: Color.fromARGB(255, 255, 255, 236),
      //   ),
      // ),

      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      body: StreamBuilder(
        stream: Rent.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot Rentsnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 50.0, bottom: 4, left: 10, right: 10),
                  child: Container(
                    height: 300,
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
                        //               Rentsnap['Admn_no'],
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
                                  Text("Date:  "),
                                  //Text(medicsnap['Name']),
                                  Text(
                                    Rentsnap['Date'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),

                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Amount:  "),
                                  Text(
                                    Rentsnap['Amount'],
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ]
                                ),

                            //more list button
                            Padding(
                              padding: const EdgeInsets.only(
                                  //top: 10.0,
                                  left: 260),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/student_pay_hostelrent',
                                          arguments: {
                                            // 'email': hostsnap['email'],
                                            'Date': Rentsnap['Date'],
                                            'Amount': Rentsnap['Amount'],
                                            // 'Per_head_amnt':
                                            
                                          });
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (ctx) => MoreVeh(),
                                      //     ));
                                    },
                                    icon: const Icon(
                                        Icons.arrow_back_ios_new_outlined),
                                    iconSize: 20,
                                    color: Colors.blue,
                                  ),
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon: Icon(Icons.delete),
                                  //   iconSize: 30,
                                  //   color: const Color.fromARGB(255, 32, 26, 25),
                                  // ),
                                ],
                              ),
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
