import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddCashOnHand extends StatefulWidget {
const AddCashOnHand({super.key});

  @override
  State<AddCashOnHand> createState() => _AddCashOnHandState();
}

class _AddCashOnHandState extends State<AddCashOnHand> {


final CollectionReference hostel =
      FirebaseFirestore.instance.collection('cash_on_hand');
  TextEditingController Name = TextEditingController();
  TextEditingController AdmnNo = TextEditingController();
  TextEditingController Department = TextEditingController();
  // TextEditingController Rent = TextEditingController();

void addrooms() async {
    final data = {
      'Name': Name.text,
      'AdmnNo': AdmnNo.text,
      'Department': Department.text,
      // 'Rent': Rent.text,

      
    };
    
      hostel.add(data);

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
        title: Text("Add Cash on Hand"),
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
          controller: Department,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
          label: Text("Department"),
        ),
        ),
      ),
      //  Padding(
      //    padding: const EdgeInsets.all(20),
      //    child: TextField(
      //      controller: Rent,

      //     decoration:InputDecoration(focusedBorder:OutlineInputBorder(
      //     borderRadius: BorderRadius.vertical(
      //       top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
      //         color: Colors.black,width: 1),
      //        ),
      //     label: Text("Rent"),
      //        ),
      //        ),
      //  ),
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

        Padding(
          padding: const EdgeInsets.only(top: 10,right: 80,left: 80),
          child: ElevatedButton(onPressed: (){

                      addrooms();
                      Navigator.pop(context);

              // submit();
          }, child: Text("Add",
          style: TextStyle(fontSize: 20),
          ),
          style: ButtonStyle( foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 236)),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 33, 54, 68)),
                    minimumSize: MaterialStateProperty.all(Size(50,40),
                    ),
                    ),
                   
          ),
        )
      
      
      ],
      ) ,

    );
  }
}