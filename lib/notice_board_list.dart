import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:cs/add_rooms.dart';
class ListNotice extends StatefulWidget {
  const ListNotice({super.key});

  @override
  State<ListNotice> createState() => _ListNoticeState();
}

class _ListNoticeState extends State<ListNotice> {
  final CollectionReference notice =
      FirebaseFirestore.instance.collection('add_notice');


      // void deleteRooms(docId){
      //   hostel.doc(docId).delete();


      // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notice"),foregroundColor: Color.fromARGB(255, 255, 255, 236),
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
        stream: notice.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot noticesnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 4,left: 10,right: 10),
                  child: Container(
                    height: 150,
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
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 16,bottom: 20,left: 4,right: 4),
                        //   child: Container(
                        //     child: CircleAvatar(
                        //       backgroundColor: const Color.fromARGB(255, 33, 54, 68),
                        //       radius: 50,
                        //       child: 
                        //       Text(
                        //         hostelsnap['Date'],
                        //         style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 255, 255, 236)),
                        //       )))),
                          
                      
                        Padding(
                          padding: const EdgeInsets.only(right: 10,left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text(" Program :"),
                              //Text(medicsnap['Name']),
                              Text(
                                noticesnap['Program Name'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                              ]
                              ),
                              
                              Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Time:"),
                              Text(
                                noticesnap['Time'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                          
                              )]), Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Date:"), Text(
                                noticesnap['Date'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                          
                              )
                              ]
                              ),
                          
                              Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Description:"), Text(
                                noticesnap['Description'],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                          
                              )
                              ]
                              )
                              //Text(medicsnap['Email']),
                            ],
                          ),
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