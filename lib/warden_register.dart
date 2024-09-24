import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class wardenRegister extends StatefulWidget {

//   TextEditingController Name=TextEditingController();
//   TextEditingController Address=TextEditingController();
// TextEditingController Admnumber=TextEditingController();
// TextEditingController Course=TextEditingController();
// TextEditingController Mob=TextEditingController();
// TextEditingController Email=TextEditingController();

// void submit()

const wardenRegister({super.key});

  @override
  State<wardenRegister> createState() => _wardenRegisterState();
}

class _wardenRegisterState extends State<wardenRegister> {

TextEditingController Name=TextEditingController();
// TextEditingController Address=TextEditingController();
// TextEditingController Admnumber=TextEditingController();
// TextEditingController Course=TextEditingController();
TextEditingController Phone=TextEditingController();
TextEditingController Email=TextEditingController();
TextEditingController Password=TextEditingController();

void submit()
async{
  try{

  var user=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: Email.text, password: Password.text);

  final DocumentReference reg=FirebaseFirestore.instance.collection('warden_register').doc(user.user?.uid);

  var reslt=await reg.get();
  if(reslt.exists){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User aldready exist,Please login!')));
  }

  final data={
    'Name':Name.text,
    // 'address':Address.text,
    // 'admnumber':Admnumber.text,
    // 'course':Course.text,
    'Phone':Phone.text,
    'Email':Email.text,
    'Password':Password.text,
    'uid':user.user?.uid,
  };
  reg.set(data);
  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Warden Register"),
    foregroundColor: Color.fromARGB(255, 255, 255, 236),
    backgroundColor:const Color.fromARGB(255, 33, 54, 68),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1),)
      ,elevation:70,),
      
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      body:ListView(children: [Padding(
        padding: const EdgeInsets.all(20),
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
      //  Padding(
      //    padding: const EdgeInsets.all(20),
      //    child: TextField(
      //     controller: Address,
      //     decoration:InputDecoration(focusedBorder:OutlineInputBorder(
      //     borderRadius: BorderRadius.vertical(
      //       top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
      //         color: Colors.black,width: 1),
      //        ),
      //     label: Text("Address"),
      //        ),
      //        ),
      //  ),
      // Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: TextField(
      //     controller: Admnumber,
      //     decoration:InputDecoration(focusedBorder:OutlineInputBorder(
      //     borderRadius: BorderRadius.vertical(
      //       top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
      //         color: Colors.black,width: 1),
      //   ),
      //     label: Text("Admission Number"),
      //   ),
      //   ),
      // ),
      //  Padding(
      //    padding: const EdgeInsets.all(20),
      //    child: TextField(
      //      controller: Course,
      //     decoration:InputDecoration(focusedBorder:OutlineInputBorder(
      //     borderRadius: BorderRadius.vertical(
      //       top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
      //         color: Colors.black,width: 1),
      //        ),
      //     label: Text("Course"),
      //        ),
      //        ),
      //  ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
           controller: Phone,
          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("Phone"),
             ),
             ),
       ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
           controller: Email,
          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color:Colors.black,width: 1),
             ),
          label: Text("Email"),
             ),
             ),
             
            
       ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(controller: Password,
                      decoration: InputDecoration(
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.zero,bottom: Radius.zero),
                          ),label: Text("Password"),
                          ),
         ),
       ),

        Padding(
          padding: const EdgeInsets.only(top: 10,right: 78,left: 78),
          child: ElevatedButton(onPressed: (){

              submit();
          }, child: Text("Submit",
          style: TextStyle(fontSize: 13),
          ),
          style: ButtonStyle( foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 243, 243, 195)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 33, 54, 68)),
                    minimumSize: MaterialStateProperty.all(Size(3,40),
                    ),
                    ),
                   
          ),
        )
      
      
      ],
      ) ,

    );
  }
}