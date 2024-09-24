// import 'package:cs/login.dart';
// import 'package:cs/register.dart';
import 'package:cs/AddNotice.dart';
import 'package:cs/Add_expense.dart';
import 'package:cs/MatronHome.dart';
import 'package:cs/Mess.dart';
import 'package:cs/Messbill.dart';
import 'package:cs/Student_pay_messbill.dart';
import 'package:cs/Updatemenu.dart';
// import 'package:cs/add_attendance.dart';
import 'package:cs/add_cash_on_hand.dart';
import 'package:cs/add_leave_notification.dart';
import 'package:cs/add_menu_list.dart';
import 'package:cs/add_mess_menu.dart';
import 'package:cs/add_messbill.dart';
import 'package:cs/add_rent.dart';

import 'package:cs/add_rooms.dart';
import 'package:cs/add_student.dart';
import 'package:cs/cash_on_hand_list.dart';
import 'package:cs/firebase_options.dart';
import 'package:cs/hostel_fee.dart';
import 'package:cs/hostel_rentlist.dart';
import 'package:cs/list_add_daily_expense.dart';
import 'package:cs/matronProfile.dart';
import 'package:cs/matronlogin.dart';
import 'package:cs/matronregister.dart';
import 'package:cs/mess_bill_list.dart';
import 'package:cs/messbill_paymentdetails.dart';
// import 'package:cs/notice_board.dart';
import 'package:cs/notice_board_list.dart';
import 'package:cs/parent_communication.dart';
import 'package:cs/parent_communication_tomatron.dart';
import 'package:cs/parent_home.dart';
import 'package:cs/parent_login.dart';
import 'package:cs/parent_profile.dart';
import 'package:cs/parent_register.dart';
import 'package:cs/rent.dart';
import 'package:cs/rooms.dart';
import 'package:cs/list.dart';
import 'package:cs/login.dart';
import 'package:cs/register.dart';
import 'package:cs/splash.dart';
import 'package:cs/student_attendance.dart';
import 'package:cs/student_complaint.dart';
import 'package:cs/student_home.dart';
import 'package:cs/student_pay_hostelrent.dart';
import 'package:cs/studentprofile.dart';
import 'package:cs/updateExpense.dart';
import 'package:cs/update_rooms.dart';
import 'package:cs/user_interface.dart';
import 'package:cs/view_attendance.dart';
import 'package:cs/view_compalint.dart';
//import 'package:cs/view_complaint.dart';
import 'package:cs/view_expense.dart';
import 'package:cs/view_room.dart';
import 'package:cs/view_studentdetails_wardenside.dart';
import 'package:cs/warden_home.dart';
import 'package:cs/warden_login.dart';
import 'package:cs/warden_profile.dart';
import 'package:cs/warden_register.dart';

import 'package:firebase_core/firebase_core.dart';
// import 'package:cs/splash.dart';
// import 'package:cs/splash.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          '/Splash': (context) => splash(),

          '/userinterface': (context) => Userinterface(),
          '/addRent': (context) => AddRent(),

          //bill()   matron

          '/matronlogin ': (context) => Matronlogin(),
          '/MatronRegister ': (context) => matronRegister(),
          '/matronHome': (context) => MatronHome(),
          '/matronProfile': (context) => MatronProfile(),
          '/addMessbill': (context) => AddMessbill(),
          '/listMessBill': (context) => ListMessBill(),
          '/addNotice': (context) => AddNotice(),
          '/addExpense': (context) => AddExpense(),
          '/listDailyExpense': (context) => ListDailyExpense(),

          '/updateExpense': (context) => UpdateExpense(),
          '/listComplaint': (context) => ListComplaint(),
          '/addrooms': (context) => AddRooms(),
          '/listrooms': (context) => ListRooms(),
          '/updaterooms': (context) => UpdateRooms(),
          '/ParentCommunication': (context) => parentCommunication(),
          '/messMenuList': (context) => MessMenuList(),
          '/addMenu': (context) => AddMenu(),
          '/updateMenu': (context) => UpdateMenu(),
          '/studentAttendance': (context) => StudentAttendance(),
          // '/addAttendance':(context) => AddAttendance(),
          '/addStudent': (context) => AddStudent(),
          '/ leaveNotification': (context) => LeaveNotification(),
          '/listCashOnHand': (context) => ListCashOnHand(),
          '/addCashOnHand': (context) => AddCashOnHand(),
          // '/addExpense':(context) =>AddExpense(),

//warden
          '/wardenlogin': (context) => Wardenlogin(),
          '/wardenRegister': (context) => wardenRegister(),
          '/wardenHome': (context) => WardenHome(),
          '/wardenProfile': (context) => WardenProfile(),
          '/viewExpense': (context) => ViewExpense(),
          '/view_messbill_Paid_Rent': (context) => View_messbill_Paid_Rent(),
          '/view_studentdetails_warden': (context) =>
              View_studentdetails_warden(),

//parent

          '/parentLogin': (context) => ParentLogin(),
          '/parentRegister': (context) => ParentRegister(),
          '/parentHome': (context) => ParentHome(),
          '/ParentProfile': (context) => ParentProfile(),
          '/Parent_communication_tomatron': (context) =>
              parent_communication_tomatron(),

          // '/ParentCommunication': (context) => parentCommunication(),
          '/listAttendance': (context) => ListAttendance(),

//students

          '/StudentLogin': (context) => login(),
          '/StudentRegister': (context) => register(),
          '/studentHome': (context) => StudentHome(),
          '/studentProfile': (context) => StudentProfile(),
          '/listNotice': (context) => ListNotice(),

//hostelfee page
          '/fee': (context) => Fee(),
//
          '/Rent': (context) => rent(),
          '/Mess': (context) => mess(),
          '/student_pay_messbill': (context) => Student_pay_messbill(),
          '/hostel_rentlist': (context) => Hostel_rentlist(),
          '/student_pay_hostelrent': (context) => Student_pay_hostelrent(),

          '/addComplaint': (context) => AddComplaint(),

          '/rooms': (context) => Rooms(),
// '/addrooms':(context) => AddRooms(),
          '/viewRooms': (context) => ViewRooms(),
// '/updaterooms':(context) =>  UpdateRooms(),
        },
        initialRoute: '/',
        home: splash());
  }
}
