import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:cs/Add_expense.dart';

class ViewExpense extends StatefulWidget {
  const ViewExpense({super.key});

  @override
  State<ViewExpense> createState() => _ViewExpenseState();
}

class _ViewExpenseState extends State<ViewExpense> {
  final CollectionReference mess =
      FirebaseFirestore.instance.collection('expense');


      // void deleteExpense(docId){
      //   mess.doc(docId).delete();


      // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Expense"),
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
        stream: mess.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot messsnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 4,right: 1,left: 1),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16,bottom: 20,right: 4),
                          child: Container(
                            child: CircleAvatar(
                              backgroundColor: const Color.fromARGB(255, 33, 54, 68),
                              radius: 50,
                              child: 
                              Text(
                               messsnap['Category'],
                                style: TextStyle(fontSize: 20,color: const Color.fromARGB(255, 255, 255, 236)),
                              )))),
                          
                      
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                             Text("Date:  "),
                            //Text(medicsnap['Name']),
                            Text(
                            messsnap['Date'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                            ]
                            ),
                            
                            Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Expense_amnt:  "),
                            Text(
                            messsnap['Expense_amnt'].toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),

                            )]), Row(mainAxisAlignment:MainAxisAlignment.center,children: [ Text("Quantity:  "), Text(
                            messsnap['Quantity'].toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),

                            )
                            ]
                            )
                            //Text(medicsnap['Email']),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     IconButton(
                        //       onPressed: () {

                        //         Navigator.pushNamed(context, '/updateExpense',
                        //             arguments: {
                        //               'Date': messsnap['Date'],
                        //               'Category': messsnap['Category'].toString(),
                        //               'Expense_amnt': messsnap['Expense_amnt'].toString(),
                        //               'Quantity': messsnap['Quantity'].toString(),
                        //               'id': messsnap.id,
                        //             });
                        //       },
                        //       icon: Icon(Icons.edit),
                        //       iconSize: 30,
                        //       color: const Color.fromARGB(255, 33, 54, 68),
                        //     ),



                        //     IconButton(
                        //       onPressed: () {
                        //         deleteExpense(messsnap.id);
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