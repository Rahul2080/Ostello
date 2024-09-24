// import 'package:cs/login.dart';
// import 'package:cs/register.dart';
import 'package:admin_login/remove_students.dart';
import 'package:admin_login/view_Hostel_Rent.dart';
import 'package:admin_login/Complaints.dart';
import 'package:admin_login/View_Paid_Rent.dart';
import 'package:admin_login/add_hostelrent.dart';
import 'package:admin_login/admin_login.dart';
import 'package:admin_login/firebase_options.dart';
import 'package:admin_login/home.dart';
import 'package:admin_login/add_student_admission.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        routes: {
          '/adminLogin': (context) => AdminLogin(),
          '/adminHome': (context) => AdminHome(),
          '/studentAdmn': (context) => StudentAdmn(),
          '/addRent': (context) => AddRent(),
          '/listAddRent': (context) => ListAddRent(),
          '/listComplaint': (context) => ListComplaint(),

          '/remove_student': (context) => Remove_student(),
//'/studentAdmn':(context) =>  StudentAdmn(),
          '/view_Paid_Rent': (context) => View_Paid_Rent(),
// '/updaterooms':(context) =>  UpdateRooms(),
        },
        initialRoute: '/',
        home: AdminLogin());
  }
}
