import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddMenu extends StatefulWidget {
const AddMenu({super.key});

  @override
  State<AddMenu> createState() => _AddMenuState();
}

class _AddMenuState extends State<AddMenu> {


final CollectionReference hostel =
      FirebaseFirestore.instance.collection('add_mess_menu');
  TextEditingController Breakfast = TextEditingController();
  TextEditingController Lunch = TextEditingController();
  TextEditingController Snack = TextEditingController();
  TextEditingController Dinner = TextEditingController();

void addmessmenu() async {
    final data = {
      'Breakfast': Breakfast.text,
      'Lunch': Lunch.text,
      'Snack': Snack.text,
      'Dinner': Dinner.text,

      
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
 final Week = ['Sunday','Monday','Tuesday','Wednesday','Thursday', 'Friday','Saturday'];
  String? selectWeek;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Add Mess Menu"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
    backgroundColor:const Color.fromARGB(255, 33, 54, 68),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1),)
      ,elevation:70,),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),



      body:ListView(children: [
        
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 25, left: 25),
                    child: Text(
                      'Week',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 77, 8, 8),
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 25, left: 50),
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            label: Text(
                              'Select Week',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 18),
                            ),
                          ),
                          items: Week
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            selectWeek = val as String?;
                          }),
                    ),
                  ),
                ],
              ),


        Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: Breakfast,


          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
        label: Text("Breakfast"),
        ),
        
        
        
        ),
      ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
          controller: Lunch,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("Lunch"),
             ),
             ),
       ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: TextField(
          controller: Snack,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
        ),
          label: Text("Snack"),
        ),
        ),
      ),
       Padding(
         padding: const EdgeInsets.all(20),
         child: TextField(
           controller: Dinner,

          decoration:InputDecoration(focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.vertical(
            top:Radius.zero,bottom: Radius.zero),borderSide: BorderSide(
              color: Colors.black,width: 1),
             ),
          label: Text("Dinner"),
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
          padding: const EdgeInsets.only(top: 10,right: 80,left: 80),
          child: ElevatedButton(onPressed: (){

                      addmessmenu();
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