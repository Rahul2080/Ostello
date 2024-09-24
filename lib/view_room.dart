import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cs/add_rooms.dart';
class ViewRooms extends StatefulWidget {
  const ViewRooms({super.key});

  @override
  State<ViewRooms> createState() => _ViewRoomsState();
}

class _ViewRoomsState extends State<ViewRooms> {
  final CollectionReference hostel =
      FirebaseFirestore.instance.collection('Rooms');


      // void deleteRooms(docId){
      //   hostel.doc(docId).delete();


      // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rooms"),foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      ),


//floating action button

      //  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/addrooms');
      //   },
      //   backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      //   mini: false,
      //   tooltip: 'Share File',
      //   child: Icon(Icons.add,color:Color.fromARGB(255, 255, 255, 236) ,),
      // ),



      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      body: StreamBuilder(
        stream: hostel.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot hostelsnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 4),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 0),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16,bottom: 20,left:15 ,right: 15),
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: const Color.fromARGB(255, 33, 54, 68),
                              radius: 30,
                              child: 
                              Text(
                                hostelsnap['Room no'],
                                style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 255, 255, 236)),
                              )))),
                          
                      
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 110),
                              child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Quantity of Members:  "),
                              //Text(medicsnap['Name']),
                              Text(
                                hostelsnap['Quantity'].toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                              ]
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.only(right: 90),
                              child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Vaccancy:  "),
                              Text(
                                hostelsnap['Vaccancy'].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              
                              )]),
                            ), Padding(
                              padding: const EdgeInsets.only(right:100),
                              child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Rent:  "),
                               Text(
                                hostelsnap['Rent'].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              
                              )
                              ]
                              ),
                            )
                            //Text(medicsnap['Email']),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     IconButton(
                        //       onPressed: () {

                        //         Navigator.pushNamed(context, '/updaterooms',
                        //             arguments: {
                        //               'Room no': hostelsnap['Room no'],
                        //               'Quantity': hostelsnap['Quantity'].toString(),
                        //               'Vaccancy': hostelsnap['Vaccancy'].toString(),
                        //               'Rent': hostelsnap['Rent'].toString(),
                        //               'id': hostelsnap.id,
                        //             });
                        //       },
                        //       icon: Icon(Icons.edit),
                        //       iconSize: 30,
                        //       color: const Color.fromARGB(255, 33, 54, 68),
                        //     ),



                        //     IconButton(
                        //       onPressed: () {
                        //         deleteRooms(hostelsnap.id);
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