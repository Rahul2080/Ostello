import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cs/add_mess_menu.dart';
// import 'package:cs/add_rooms.dart';
class MessMenuList extends StatefulWidget {
  const MessMenuList({super.key});

  @override
  State<MessMenuList> createState() => _MessMenuListState();
}

class _MessMenuListState extends State<MessMenuList> {
  final CollectionReference hostel =
      FirebaseFirestore.instance.collection('add_mess_menu');


      void deleteMenu(docId){
        hostel.doc(docId).delete();


      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mess Menu"),foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      ),


//floating action button

       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addMenu');
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
                  padding: const EdgeInsets.only(top: 10, bottom: 2),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 16,bottom: 20,left: 4,right: 4),
                        //   child: Container(
                        //     child: CircleAvatar(
                        //       backgroundColor: const Color.fromARGB(255, 33, 54, 68),
                        //       radius: 50,
                        //       child: 
                        //       Text(
                        //         hostelsnap['Breakfast'],
                        //         style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 255, 255, 236)),
                        //       )))),
                          
                      
                        Padding(
                          padding: const EdgeInsets.only(top: 10,),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 40,left: 5),
                                child:
                                 Row(mainAxisAlignment:MainAxisAlignment.center,children: [ 
                                  Text("Breakfast:  ",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                //Text(medicsnap['Name']),
                                Text(
                                  hostelsnap['Breakfast'].toString(),
                                  style: TextStyle(
                                      fontSize: 18 ),
                                )
                                ]
                                ),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Lunch:  ",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text(
                                  hostelsnap['Lunch'].toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                
                                )]),
                              ),
                               
                              Padding(
                                padding: const EdgeInsets.only(left:5),
                                child:
                               Row(mainAxisAlignment:MainAxisAlignment.center,children: [ 
                                Text("Snack:  ",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(
                                hostelsnap['Snack'].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                          
                              )]),),
                          
                               
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child:
                               Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Dinner:  ",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),), Text(
                                hostelsnap['Dinner'].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                          
                              )
                              ]
                              )),
                              //Text(medicsnap['Email']),
                            ],
                          ),
                        ),
                        Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:6,left:60),
                                child: IconButton(
                                  onPressed: () {
                                                          
                                    Navigator.pushNamed(context, '/updateMenu',
                                        arguments: {
                                          'Breakfast': hostelsnap['Breakfast'],
                                          'Lunch': hostelsnap['Lunch'].toString(),
                                          'Snack': hostelsnap['Snack'].toString(),
                                          'Dinner': hostelsnap['Dinner'].toString(),
                                          'id': hostelsnap.id,
                                        });
                                  },

                                  icon: Padding(
                                    padding: const EdgeInsets.only(bottom: 180),
                                    child: Icon(Icons.edit),
                                  ),
                                  iconSize: 25,
                                  color: const Color.fromARGB(255, 33, 54, 68),
                                ),
                              ),
                          
                          
                          
                              Padding(
                                padding: const EdgeInsets.only(bottom: 100),
                                child: IconButton(
                                  onPressed: () {
                                    deleteMenu(hostelsnap.id);
                                  },
                                  icon: Icon(Icons.delete),
                                  iconSize: 25,
                                  color: const Color.fromARGB(255, 33, 54, 68),
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