import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddMessbill extends StatefulWidget {
const AddMessbill({super.key});

  @override
  State<AddMessbill> createState() => _AddMessbillState();
}

class _AddMessbillState extends State<AddMessbill> {


final CollectionReference host =
      FirebaseFirestore.instance.collection('add_messbill');
  TextEditingController Date= TextEditingController();
  TextEditingController Total_amnt = TextEditingController();
  TextEditingController Per_head_amnt = TextEditingController();
  // TextEditingController Rent = TextEditingController();

void addmessbill() async {
    final data = {
      'Date':Date.text,
      'Total_amnt': Total_amnt.text,
      'Per_head_amnt':  Per_head_amnt.text,
      // 'Rent': Rent.text,

      
    };
    
      host.add(data);

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
        title: Text("Add Messbill"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
    backgroundColor:const Color.fromARGB(255, 33, 54, 68),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1),)
      ,elevation:70,),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),



      body:ListView(children: [Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller:Date,


          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
        label: Text("Date"),
        ),
        
        
        
        ),
      ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
          controller:Total_amnt,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("Total Amount"),
             ),
             ),
       ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller:Per_head_amnt,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
          label: Text("Per Head Amount"),
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

                      addmessbill();
                      Navigator.pop(context);

              // submit();
          }, child: Text("Submit",
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