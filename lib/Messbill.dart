import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessBill extends StatefulWidget {
  const MessBill({super.key});

  @override
  State<MessBill> createState() => _HomeState();
}

class _HomeState extends State<MessBill> {
  final CollectionReference mess =
      FirebaseFirestore.instance.collection('MessBill');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hostel Fee"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      ),
      body: StreamBuilder(
        stream: mess.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot messsnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 4),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            spreadRadius: 15),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 33, 54, 68),
                              radius: 50,
                              child: Text(
                                messsnap['Name'],
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Admission number:  "),
                                //Text(medicsnap['Name']),
                                Text(
                                  messsnap['Admn no'].toString(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                messsnap['Messbill'].toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                messsnap['Rent'].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            //Text(medicsnap['Email']),
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
