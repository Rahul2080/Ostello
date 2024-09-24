import 'package:admin_login/admin_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Home'),
          foregroundColor: Color.fromARGB(255, 255, 255, 236),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 33, 54, 68)),

      body: ListView(
        children: [
          //correct 1st img nd second im

          Row(
            children: [
//1)icon

              Padding(
                padding: const EdgeInsets.only(
                  top: 150.0,
                  left: 350,
                  right: 70,
                ),
                child: IconButton(
                  icon: Icon(Icons.receipt_long),
                  onPressed: () {
                    Navigator.pushNamed(context, '/studentAdmn');
                    // Handle button press
                    print('IconButton pressed!');
                  },
                  color: Color.fromARGB(
                      255, 33, 54, 68), // Optional: Set the color of the icon
                  iconSize: 30.0, // Optional: Set the size of the icon
                  tooltip:
                      'Love', // Optional: Displayed on long press for accessibility
                ),
              ),

              //2)icon

              Padding(
                padding:
                    const EdgeInsets.only(left: 100, top: 150.0, right: 170),
                child: IconButton(
                  icon: Icon(Icons.format_list_bulleted_add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/listAddRent');
                    // Handle button press
                    // Handle button press
                    print('IconButton pressed!');
                  },
                  color: Color.fromARGB(
                      255, 33, 54, 68), // Optional: Set the color of the icon
                  iconSize: 30.0, // Optional: Set the size of the icon
                  tooltip:
                      'Love', // Optional: Displayed on long press for accessibility
                ),
              ),
              // Text(
              //   "Add Hostel Rent",
              //   style: TextStyle(fontSize: 20),
              // ),

//3)

              Padding(
                padding:
                    const EdgeInsets.only(top: 150.0, right: 250, left: 70),
                child: IconButton(
                  icon: Icon(Icons.list_alt),
                  onPressed: () {
                    Navigator.pushNamed(context, '/view_Paid_Rent');
                    // Handle button press
                    print('IconButton pressed!');
                  },
                  color: Color.fromARGB(
                      255, 33, 54, 68), // Optional: Set the color of the icon
                  iconSize: 30.0, // Optional: Set the size of the icon
                  tooltip:
                      'Love', // Optional: Displayed on long press for accessibility
                ),
              ),
              // Text(
              //   "View Paid Hostel Rent",
              //   style: TextStyle(fontSize: 20),
              // ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 300.0),
            child: Row(
              children: [
                //1)text

                Text(
                  "Student Admission",
                  style: TextStyle(fontSize: 20),
                ),

                //2)text
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Text(
                    "Add Hostel Rent",
                    style: TextStyle(fontSize: 20),
                  ),
                ),

//3)text

                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Text(
                    "View Paid Hostel Rent",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),

          ///2nd row icon
          ///
          //  Padding(
          //    padding: const EdgeInsets.all(8.0),
          //child:
          Row(
            children: [
              //1)icon
              Padding(
                padding: const EdgeInsets.only(
                  top: 100.0,
                  left: 550,
                  right: 70,
                ),
                child: IconButton(
                  icon: Icon(Icons.list_sharp),
                  onPressed: () {
                    Navigator.pushNamed(context, '/listComplaint');
                    // Handle button press
                    print('IconButton pressed!');
                  },
                  color: Color.fromARGB(
                      255, 33, 54, 68), // Optional: Set the color of the icon
                  iconSize: 30.0, // Optional: Set the size of the icon
                  tooltip:
                      'Love', // Optional: Displayed on long press for accessibility
                ),
              ),

              //2)icon

              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 100.0),
                child: IconButton(
                  icon: Icon(Icons.person_remove),
                  onPressed: () {
                    Navigator.pushNamed(context, '/remove_student');
                    // Handle button press
                    print('IconButton pressed!');
                  },
                  color: Color.fromARGB(
                      255, 33, 54, 68), // Optional: Set the color of the icon
                  iconSize: 30.0, // Optional: Set the size of the icon
                  tooltip:
                      'Love', // Optional: Displayed on long press for accessibility
                ),
              ),
            ],
          ),

//2)1st row text

          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 500,
              right: 70,
            ),
            child: Row(
              children: [
                //1)text
                Text(
                  "View Complaints",
                  style: TextStyle(fontSize: 20),
                ),

                //2)text

                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 70.0),
                  child: Text(
                    "Remove Students",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),

          ///
          //),
        ],
      ),

      // body: ListView(
      //   children: [
      //   //correct 1st img nd second im
      //   Padding(
      //     padding: const EdgeInsets.only(top: 4, left: 300),
      //     child: Row(children: [
      //       Padding(
      //         padding: const EdgeInsets.only(top: 90, right: 10, left: 45),
      //         child: Column(
      //           children: [
      //             IconButton(
      //               icon: Icon(Icons.receipt_long),
      //               onPressed: () {
      //                 Navigator.pushNamed(context, '/studentAdmn');
      //                 // Handle button press
      //                 print('IconButton pressed!');
      //               },
      //               color: Color.fromARGB(
      //                   255, 33, 54, 68), // Optional: Set the color of the icon
      //               iconSize: 30.0, // Optional: Set the size of the icon
      //               tooltip:
      //                   'Love', // Optional: Displayed on long press for accessibility
      //             ),
      //             Text(
      //               "Student Admission",
      //               style: TextStyle(fontSize: 20),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 90, right: 60),
      //         child: Column(
      //           children: [
      //             IconButton(
      //               icon: Icon(Icons.format_list_bulleted_add),
      //               onPressed: () {
      //                 Navigator.pushNamed(context, '/listAddRent');
      //                 // Handle button press
      //                 // Handle button press
      //                 print('IconButton pressed!');
      //               },
      //               color: Color.fromARGB(
      //                   255, 33, 54, 68), // Optional: Set the color of the icon
      //               iconSize: 30.0, // Optional: Set the size of the icon
      //               tooltip:
      //                   'Love', // Optional: Displayed on long press for accessibility
      //             ),
      //             Text(
      //               "Add Hostel Rent",
      //               style: TextStyle(fontSize: 20),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 90, right: 70),
      //         child: Column(
      //           children: [
      //             IconButton(
      //               icon: Icon(Icons.list_alt),
      //               onPressed: () {
      //                 Navigator.pushNamed(context, '/view_Paid_Rent');
      //                 // Handle button press
      //                 print('IconButton pressed!');
      //               },
      //               color: Color.fromARGB(
      //                   255, 33, 54, 68), // Optional: Set the color of the icon
      //               iconSize: 30.0, // Optional: Set the size of the icon
      //               tooltip:
      //                   'Love', // Optional: Displayed on long press for accessibility
      //             ),
      //             Text(
      //               "View Paid Hostel Rent",
      //               style: TextStyle(fontSize: 20),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 350, left: 3),
      //         child: Column(
      //           children: [
      //             IconButton(
      //               icon: Icon(Icons.list_sharp),
      //               onPressed: () {
      //                 Navigator.pushNamed(context, '/listComplaint');
      //                 // Handle button press
      //                 print('IconButton pressed!');
      //               },
      //               color: Color.fromARGB(
      //                   255, 33, 54, 68), // Optional: Set the color of the icon
      //               iconSize: 30.0, // Optional: Set the size of the icon
      //               tooltip:
      //                   'Love', // Optional: Displayed on long press for accessibility
      //             ),
      //             Text(
      //               "View Complaints",
      //               style: TextStyle(fontSize: 20),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ]),
      //   ),

      //   Row(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(top: 350, right: 120),
      //         child: Column(
      //           children: [
      //             IconButton(
      //               icon: Icon(Icons.favorite),
      //               onPressed: () {
      //                 Navigator.pushNamed(context, '/remove_student');
      //                 // Handle button press
      //                 print('IconButton pressed!');
      //               },
      //               color: Color.fromARGB(
      //                   255, 33, 54, 68), // Optional: Set the color of the icon
      //               iconSize: 30.0, // Optional: Set the size of the icon
      //               tooltip:
      //                   'Love', // Optional: Displayed on long press for accessibility
      //             ),
      //             Text(
      //               "Remove Students",
      //               style: TextStyle(fontSize: 20),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ]),
    );
  }
}
