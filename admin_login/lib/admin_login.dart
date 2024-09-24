import 'dart:math';
// import 'package:cs/rooms.dart';
// import 'package:cs/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class AdminLogin extends StatelessWidget {
  TextEditingController emailController=TextEditingController();
   TextEditingController passwordController=TextEditingController();


  void login(BuildContext context) async {
   
   
    // Initialize Firebase Database

    var email = emailController.text;
    var password = passwordController.text;
    var result = await FirebaseFirestore.instance
        .collection("Admin_login")
        .where('Email', isEqualTo: email)
        .where('Password', isEqualTo: password)
        .get();
    if (result.docs.length == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Failed")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Successfull")));
      Navigator.pushNamed(context, '/adminHome');
    }
    // Specify your own table name (e.g., "user_data") instead of "users"
    // Specify your own table name (e.g., "advocate_data") instead of "advocate"
  }
  // void submit(BuildContext context) async {
  //   try {
  //     var user = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email.text, password: pass.text);

  //     if (user.user == null) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text("Login Failed"),
  //       ));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text("Login Successful"),
  //       ));
  //       Navigator.pushNamed(context, '/first_home');
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(e.toString())));
  //   }
  // }
// async{
//     try{
//     var user=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: pass.text);

//     if(user.user==null){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed"),));
//     }
//     else{
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful"),));
//       Navigator.pushNamed(context, '/studentHome');
//     }
//    }catch(e){
//      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
//    }
//    }

  AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: Text("Login"),foregroundColor: Color.fromARGB(255, 255, 255, 236),
    backgroundColor:Color.fromARGB(255, 33, 54, 68),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1),)
      ,elevation:70,),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),

      body:ListView(
        children: [Column(children: [Padding(
        padding: const EdgeInsets.only(top: 150,left: 20,right: 20),
        child: TextField( 
           controller: emailController,
          decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.zero,bottom: Radius.zero),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                        label: Text("Email"),
                        ),
                        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: TextField(  
                    controller: passwordController,
                    decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.zero,bottom: Radius.zero),
                        ),
                        label:Text( "Password"),
                    // maxLength: 6,
                    // obscureText: true,
                    // keyboardType: TextInputType.number,
          ),  ),

      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50,right: 20,left: 45),
            child: ElevatedButton(onPressed: (){   
                login(context);
            }, 
            child: Text("Login",
            
            style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle( foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 236)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 33, 54, 68), ),
                        minimumSize: MaterialStateProperty.all(Size(50, 40),
                        ),
                        ),
            ),
          ),
          
          // Padding(
          //   padding: const EdgeInsets.only(top: 50,right: 20,left: 50),
          //   child: ElevatedButton(onPressed: (){
              
          //     Navigator.of(context as BuildContext).push(MaterialPageRoute(builder: (ctx)=>register()));},
          //    child: Text("Register",
          //    style: TextStyle(fontSize: 20),
          //         ),
          //         style: ButtonStyle( foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 236)),
          //               backgroundColor: MaterialStateProperty.all(
          //                   const Color.fromARGB(255, 33, 54, 68)),
          //               minimumSize: MaterialStateProperty.all(Size(50, 40),
          //               ),
          //               ),
          //   ),
          // ),
        ],
      ),
                      ],
                      
                      ),
                      ],
                      ),
                      );
                      
  }
}