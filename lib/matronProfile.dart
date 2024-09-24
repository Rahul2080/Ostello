import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class MatronProfile extends StatefulWidget {
  const MatronProfile({super.key});

  @override
  State<MatronProfile> createState() => _MatronProfileState();
}

class _MatronProfileState extends State<MatronProfile> {
  TextEditingController Name = TextEditingController();
  // TextEditingController Address=TextEditingController();
  // TextEditingController Admnumber=TextEditingController();
  // TextEditingController Course=TextEditingController();
    TextEditingController Mob = TextEditingController();
  TextEditingController Email = TextEditingController();

  //TextEditingController username = TextEditingController();
  //TextEditingController password = TextEditingController();

  // String? selectDistrict;
  // Uint8List? image;

  // // 1)
  // String? url;

  void Submit() async {
    ////var user=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);

    final DocumentReference register =
        FirebaseFirestore.instance.collection('matron_register').doc(
            // user.user?.uid);

            // 2)
            FirebaseAuth.instance.currentUser?.uid);

//  if (user.user == null) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Registration Failed")));
//       }
//       else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("Registration Succesful")));
//         // final SharedPreferences prefs = await SharedPreferences.getInstance();
//         // await prefs.setString('username', username);
//         Navigator.pushNamed(context, '/home');
//       }

//  var res = await register.get();
//       if (res.exists) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("User aldready exist,Please login!")));
//         return;
//       }

    final data = {
      'Name': Name.text,
      // 'address':Address.text,
      // 'admnumber':Admnumber.text,
      // 'course':Course.text,
      'phone': Mob.text,
      'email': Email.text,
  
      //'district': selectDistrict,

      // 'uid': user.user?.uid,
    };

//     final storageRef = FirebaseStorage.instance.ref();

// // Create a reference to "mountains.jpg"
//     final photoref = storageRef.child("users/" + email.text + "/photo.jpg");

//     if (image != null) {
//       await photoref.putData(image!);
//       var url = await photoref.getDownloadURL();
//       data["url"] = url;
//     }
// // 3)
    register.update(data);
    //register.set(data);
  }

//  4)

  @override
  void initState() {
    // TODO: implement initState
    WidgetsFlutterBinding.ensureInitialized();
    init();
    super.initState();
  }

  // 5)
  void init() async {
    var result = await FirebaseFirestore.instance
        .collection("matron_register")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (result.docs.length == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("profile not found")));
    } else {
      var user = result.docs.first.data();

      Name.text = user['Name'];
      // Address.text= user['address'];
      // Admnumber.text = user['admnumber'];
      // Course.text = user['course'];
      Mob.text = user['phone'];
      Email.text = user['email'];
      //url = user['url'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Profile',
              style: TextStyle(fontSize: 20)),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 33, 54, 68),
          foregroundColor:  Color.fromARGB(255, 255, 255, 236),
          // backgroundColor: Colors.green,
          //   actions: [
          //     PopupMenuButton<String>(
          //       child: Icon(Icons.more),
          //       onSelected: (value) async {
          //         if (value == "profile") {
          //           Navigator.pushNamed(context, '/profile');
          //         } else if (value == "logout") {
          //           await FirebaseAuth.instance.signOut();
          //           Navigator.pushNamed(context, '/login');
          //         }
          //       },
          //       itemBuilder: (BuildContext context) {
          //         return {'profile', 'logout'}.map((String choice) {
          //           return PopupMenuItem<String>(
          //             value: choice,
          //             child: Text(choice),
          //           );
          //         }).toList();
          //       },
          //     ),
          //   ],
          ),
      body: Container(
        decoration: new BoxDecoration(
          color:  Color.fromARGB(255, 255, 255, 236),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Color.fromARGB(255, 33, 54, 68),
                //Colors.white,
                //  Color.fromARGB(255, 238, 172, 172),
                //Color.fromARGB(255, 238, 172, 137),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/person.jpg',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              // child: Image.asset(
              //   'assets/images/user.png',
              //   height: 100,
              //   width: 100,
              // ),
            ),

//////////////Image sadha square il varan
            //         (image != null)?

            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Image.memory(
            //               image!,
            //               width: 100,
            //               height: 100,
            //             ),
            //           ):

            //  // 6)
            //           url!=null?
            //            Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Image.network(
            //               url!,
            //               width: 100,
            //               height: 100,
            //             ),
            //           ):

            //             SizedBox(),

/////////////////Display the image using Image.memory in a circular shape

            // if (image != null)
            //   Padding(
            //     padding: const EdgeInsets.all(20.0),
            //     child: CircleAvatar(
            //       radius: 65, // Adjust the radius as needed
            //       backgroundColor: Colors.transparent,
            //       child: ClipOval(
            //         child: Image.memory(
            //           image!,
            //           width: 130,
            //           height: 130,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //   ),

            // // Display the image from a URL using Image.network
            // if (url != null)
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: CircleAvatar(
            //       radius: 50, // Adjust the radius as needed
            //       backgroundColor: Colors.transparent,
            //       child: ClipOval(
            //         child: Image.network(
            //           url!,
            //           width: 100,
            //           height: 100,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //   ),

            SizedBox(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: Name,
                decoration: InputDecoration(
                    label: Text(
                  'Name',
                  //  style: TextStyle(color: const Color.fromARGB(255, 19, 7, 7)),
                )),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
            //   child: TextField(
            //     controller: Address,
            //     decoration: InputDecoration(label: Text('Address')),
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
            //   child: TextField(
            //     controller: Admnumber,
            //     keyboardType: TextInputType.number,
            //     maxLength: 10,
            //     decoration: InputDecoration(label: Text('Admnumber')),
            //   ),
            // ),


//  Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: TextField(
//                 controller: Course,
//                 decoration: InputDecoration(
//                     label: Text(
//                   'Course',
//                   //  style: TextStyle(color: const Color.fromARGB(255, 19, 7, 7)),
//                 )),
//               ),
//             ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
              child: TextField(
                controller: Mob,
                decoration: InputDecoration(label: Text('Phone')),
              ),
            ),
              Padding(
              padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
              child: TextField(
                controller: Email,
                decoration: InputDecoration(label: Text('Email')),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
            //   child: TextField(
            //     controller: Mob,
            //     keyboardType: TextInputType.number,
            //     maxLength: 10,
            //     decoration: InputDecoration(label: Text('Phone')),
            //   ),
            // ),
// 7)
//           if (selectDistrict != null)
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
//               child: DropdownButtonFormField(
// //8)
//                   value: selectDistrict,
//                   decoration: InputDecoration(
//                     label: Text('Select District'),
//                   ),
//                   items: district
//                       .map((e) => DropdownMenuItem(
//                             child: Text(e),
//                             value: e,
//                           ))
//                       .toList(),
//                   onChanged: (val) {
//                     selectDistrict = val;
//                   }),
//             ),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
            //   child: TextField(
            //     controller: username,
            //     decoration: InputDecoration(
            //         border: OutlineInputBorder(), label: Text('Enter Username')),
            //     keyboardType: TextInputType.name,
            //   ),
            // ),

            //  Padding(
            //    padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
            //    child: TextField(
            //     controller: password,
            //      keyboardType: TextInputType.number,
            //     maxLength: 6,
            //        decoration: InputDecoration(
            //           border: OutlineInputBorder(),
            //           label: Text('Enter Password')
            //         ),
            //            ),
            //  ),

            // if(image!=null)
            // Image.memory(
            //   image!,
            //   width: 100,
            //   height: 100,
            // ),

            // ElevatedButton(
            //     onPressed: () async {
            //       final ImagePicker picker = ImagePicker();
            //       image =
            //           await (await picker.pickImage(source: ImageSource.gallery))
            //               ?.readAsBytes();
            //       setState(() {});
            //     },
            //     child: Text('Edit Image')),

            Padding(
              padding: const EdgeInsets.all(50.0),
              child: ElevatedButton(
                onPressed: () {
                  Submit();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Update Profile")));
                },
                child: Text(
                  'Update',
                  style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 255, 255, 236) ),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(300, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 33, 54, 68)),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(left: 50, right: 50),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}