import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cs/add_cash_on_hand.dart';
// import 'package:cs/add_rooms.dart';
class ListCashOnHand extends StatefulWidget {
  const ListCashOnHand({super.key});

  @override
  State<ListCashOnHand> createState() => _ListCashOnHandState();
}

class _ListCashOnHandState extends State<ListCashOnHand> {
  final CollectionReference hostel =
      FirebaseFirestore.instance.collection('cash_on_hand');


      void deleteRooms(docId){
        hostel.doc(docId).delete();


      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cash On Hand"),foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      ),


//floating action button

       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addCashOnHand');
        },
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
        mini: false,
        tooltip: 'Share File',
        child: Icon(Icons.add,color:Color.fromARGB(255, 255, 255, 236) ,),
      ),



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
                    height: 100,
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
                          padding: const EdgeInsets.only(top: 16,bottom: 20,left: 4,right: 4),
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: const Color.fromARGB(255, 33, 54, 68),
                              radius: 60,
                              child: 
                              Text(
                                hostelsnap['AdmnNo'],
                                style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 255, 255, 236)),
                              )))),
                          
                      
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 140),
                              child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Name:  "),
                              //Text(medicsnap['Name']),
                              Text(
                                hostelsnap['Name'].toString(),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                              ]
                              ),
                            ),
                            
                            // Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("AdmnNo:  "),
                            // Text(
                            //   hostelsnap['AdmnNo'].toString(),
                            //   style: TextStyle(
                            //     fontSize: 18,
                            //   ),

                            // )]),
                             Padding(
                               padding: const EdgeInsets.only(right:10),
                               child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Department:  "), Text(
                                hostelsnap['Department'].toString(),
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