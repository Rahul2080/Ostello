import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddRent extends StatefulWidget {
  const AddRent({super.key});

  @override
  State<AddRent> createState() => _AddRentState();
}

class _AddRentState extends State<AddRent> {
  final CollectionReference Rent =
      FirebaseFirestore.instance.collection('Hostel_Rent');
  // TextEditingController Name= TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController Amount = TextEditingController();

  void addrent() async {
    final data = {
      // ' Name': Name.text,
      'Date': Date.text,
      'Amount': Amount.text,
    };

    Rent.add(data);
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
        title: Text("Hostel Fee"),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 70,
      ),
      backgroundColor: Color.fromARGB(255, 243, 243, 195),
      body: ListView(
        children: [
          //   Padding(
          //   padding: const EdgeInsets.all(20),
          //   child: TextField(
          //     controller: Name,

          //     decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          //     borderRadius: BorderRadius.vertical(
          //       top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
          //         color: Colors.black,width: 1),
          //   ),
          //   label: Text("Name"),
          //   ),

          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: Date,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.zero, bottom: Radius.zero),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                label: Text("Date"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: Amount,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.zero, bottom: Radius.zero),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                label: Text("Amount"),
              ),
            ),
          ),

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
            padding: const EdgeInsets.only(top: 10, right: 140, left: 140),
            child: ElevatedButton(
              onPressed: () {
                addrent();
                Navigator.pop(context);

                // submit();
              },
              child: Text(
                "Add",
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 243, 243, 195)),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 33, 54, 68)),
                minimumSize: MaterialStateProperty.all(
                  Size(3, 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
