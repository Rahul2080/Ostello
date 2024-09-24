

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddComplaint extends StatefulWidget {
const AddComplaint({super.key});

  @override
  State<AddComplaint> createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {


final CollectionReference Complaints =
      FirebaseFirestore.instance.collection('student_complaint');
  TextEditingController Name = TextEditingController();
  TextEditingController AdmnNo = TextEditingController();
  TextEditingController Dep= TextEditingController();
  TextEditingController Complaint = TextEditingController();

void addcomplaint() async {
    final data = {
      'Name':  Name .text,
      'AdmnNo': AdmnNo.text,
      'Department': Dep.text,
      'Complaints':  Complaint.text,

      
    };
    
      Complaints.add(data);

}

// TextEditingController Name=TextEditingController();
// TextEditingController Address=TextEditingController();
// TextEditingController Admnumber=TextEditingController();
// TextEditingController Course=TextEditingController();
// TextEditingController Mob=TextEditingController();
// TextEditingController Email=TextEditingController();
// TextEditingController Password=TextEditingController();

// void submit()
// async{
//   try{

//   var user=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: Email.text, password: Password.text);

//   final DocumentReference reg=FirebaseFirestore.instance.collection('register').doc(user.user?.uid);

//   var reslt=await reg.get();
//   if(reslt.exists){
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User aldready exist,Please login!')));
//   }

//   final data={
//     'Name':Name.text,
//     'address':Address.text,
//     'admnumber':Admnumber.text,
//     'course':Course.text,
//     'phone':Mob.text,
//     'email':Email.text,
//     'Password':Password.text,
//     'uid':user.user?.uid,
//   };
//   reg.set(data);
//   }catch(e){
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Complaints"),foregroundColor: const Color.fromARGB(255, 255, 255, 236),
    backgroundColor:const Color.fromARGB(255, 33, 54, 68),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1),)
      ,elevation:70,),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),



      body:ListView(children: [Padding(
        padding: const EdgeInsets.all(25),
        child: TextField(
          controller: Name,


          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
        label: Text("Name"),
        ),
        
        
        
        ),
      ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
          controller: AdmnNo,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("AdmnNo"),
             ),
             ),
       ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller:  Dep,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
          label: Text("Department"),
        ),
        ),
      ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
           controller:  Complaint,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("Complaint"),
             ),
             ),
       ),

       Padding(
          padding: const EdgeInsets.only(top: 10,right: 78,left: 78),
          child: ElevatedButton(onPressed: (){

              
          }, child: Text("Submit",
          style: TextStyle(fontSize: 13),
          ),
          style: ButtonStyle( foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 236)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 33, 54, 68)),
                    minimumSize: MaterialStateProperty.all(Size(3,40),
                    ),
                    ),
                   
          ),
        )
      //  Padding(
      //    padding: const EdgeInsets.all(20),
      //    child: TextField(
      //      controller: Mob,
      //     decoration:InputDecoration(focusedBorder:OutlineInputBorder(
      //     borderRadius: BorderRadius.vertical(
      //       top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
      //         color: Colors.blueAccent,width: 1),
      //        ),
      //     label: Text("phone number"),
      //        ),
      //        ),
      //  ),
      //  Padding(
      //    padding: const EdgeInsets.all(20),
      //    child: TextField(
      //      controller: Email,
      //     decoration:InputDecoration(focusedBorder:OutlineInputBorder(
      //     borderRadius: BorderRadius.vertical(
      //       top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
      //         color: Colors.blueAccent,width: 1),
      //        ),
      //     label: Text("email"),
      //        ),
      //        ),
             
            
      //  ),
      //  Padding(
      //    padding: const EdgeInsets.all(20),
      //    child: TextField(controller: Password,
      //                 decoration: InputDecoration(
      //                   focusedBorder:OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(30),
      //                     ),label: Text("password"),
      //                     ),
      //    ),
      //  ),

        // Padding(
        //   padding: const EdgeInsets.only(top: 10,right: 140,left: 140),
        //   child: ElevatedButton(onPressed: (){

        //               addcomplaint();
        //               Navigator.pop(context);

        //       // submit();
        //   }, child: Text("Submit",
        //   style: TextStyle(fontSize: 13),
        //   ),
        //   style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), 
        //    minimumSize: MaterialStateProperty.all(Size(5, 40)),
        //   //  maximumSize: MaterialStatePropertyAll(Size(340, 30)),
        //   foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 236)),
        //             backgroundColor: MaterialStateProperty.all(
        //                 const Color.fromARGB(255, 33, 54, 68))),
                  
        //             ),
        //             ),
      ],
          ),
        );
       }
}