// import 'package:cs/Mess.dart';
// import 'package:cs/rent.dart';
import 'package:cs/add_student.dart';
import 'package:flutter/material.dart';
// import 'package:cs/add_attendance.dart';
import 'package:cs/add_leave_notification.dart';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({super.key});

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Student Attendance"),foregroundColor:Color.fromARGB(255, 255, 255, 236) ,
    backgroundColor:Color.fromARGB(255, 33, 54, 68),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1),)
      ,elevation:70,),
     body:ListView(
        children: [
          
          
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 230)),
                 ElevatedButton.icon(
                  style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  minimumSize: MaterialStateProperty.all(Size(215, 80)),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 33, 54, 68))),
                  onPressed: () {
                     Navigator.of( context as BuildContext).push(MaterialPageRoute(builder: (ctx)=> AddStudent()));
                  }, icon: Icon(Icons.money,color: Color.fromARGB(255, 255, 255, 236)), label: Text("Add Attendance",
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 236)),)
                  ),
            

 
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: ElevatedButton.icon(
                  style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  minimumSize: MaterialStateProperty.all(Size(150, 80)),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 33, 54, 68))),
                  onPressed: () {
                    Navigator.of( context as BuildContext).push(MaterialPageRoute(builder: (ctx)=>  LeaveNotification()));
                  }, icon: Icon(Icons.money,color: Color.fromARGB(255, 255, 255, 236) ,),
                   label: Text("Add Leave Notification",
                  style: TextStyle(color: const Color.fromARGB(255, 255, 255, 236)),)
                  ),
              ),
       
        ],
     ),
        ],
        ),

    
  
        
        
        
        


      
    );
  }
}