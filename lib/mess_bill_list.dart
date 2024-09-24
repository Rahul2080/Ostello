import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'package:cs/add_rooms.dart';
class ListMessBill extends StatefulWidget {
  const ListMessBill({super.key});

  @override
  State<ListMessBill> createState() => _ListMessBillState();
}

class _ListMessBillState extends State<ListMessBill> {
  final CollectionReference host =
      FirebaseFirestore.instance.collection('add_messbill');

  // void deleteRooms(docId){
  //   hostel.doc(docId).delete();

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MessBill"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
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
        stream: host.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot hostsnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 4, right: 10, left: 10),
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
                          padding: const EdgeInsets.only(left: 80, right: 80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(" Date :"),
                                    //Text(medicsnap['Name']),
                                    Text(
                                      hostsnap['Date'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Total Amount:"),
                                    Text(
                                      hostsnap['Total_amnt'],
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  ]),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Per Head Amount:"),
                                    Text(
                                      hostsnap['Per_head_amnt'],
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    )
                                  ])
                              //Text(medicsnap['Email']),
                            ],
                          ),
                        ),

                        //more list button
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/student_pay_messbill',
                                    arguments: {
                                      // 'email': hostsnap['email'],
                                      'Date': hostsnap['Date'],
                                      'Total_amnt': hostsnap['Total_amnt'],
                                      'Per_head_amnt':
                                          hostsnap['Per_head_amnt'],
                                      // 'qty': pdctsnap['qty'],
                                      //'amount': hostsnap['amount'],
                                      // 'pollution': pdctsnap['pollution'],
                                      // 'tax': pdctsnap['tax'],
                                      // 'insurance': pdctsnap['insurance'],
                                      // 'battery w': pdctsnap['battery w'],
                                      // 'others': pdctsnap['others'],
                                    });
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (ctx) => MoreVeh(),
                                //     ));
                              },
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_outlined),
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
