import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParentHome extends StatefulWidget {
  const ParentHome({super.key});

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  TextEditingController Name = TextEditingController();
  TextEditingController Student_name = TextEditingController();
  TextEditingController AdmnNo = TextEditingController();
  TextEditingController Course = TextEditingController();
  TextEditingController Mob = TextEditingController();
  TextEditingController Email = TextEditingController();
  // TextEditingController Password= TextEditingController();

  //signout

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the login screen after successful logout
      Navigator.of(context).pushReplacementNamed('/parentLogin');
    } catch (e) {
      print("Error during logout: $e");
    }
  }

//////
  void Submit() async {
    ////var user=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);

    final DocumentReference register =
        FirebaseFirestore.instance.collection('parent_register').doc(
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
      'Student_name': Student_name.text,
      'AdmnNo': AdmnNo.text,
      'course': Course.text,
      'Mob': Mob.text,
      'Email': Email.text,

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
        .collection("parent_register")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (result.docs.length == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("profile not found")));
    } else {
      var user = result.docs.first.data();

      Name.text = user['Name'];
      Student_name.text = user['Student_name'];
      AdmnNo.text = user['AdmnNo'];
      Course.text = user['course'];
      Mob.text = user['Mob'];
      Email.text = user['Email'];
      //selectDistrict = user['district'];
      //username.text = user['username'];
      //url = user['url'];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
        // actions: [
        //   PopupMenuButton<String>(
        //     child: Icon(Icons.more),
        //     onSelected: (value) async {
        //       if (value == "profile") {
        //         Navigator.pushNamed(context, '/profile');
        //       } else if (value == "logout") {
        //         await FirebaseAuth.instance.signOut();
        //         Navigator.pushNamed(context, '/login');
        //       }
        //     },
        //     itemBuilder: (BuildContext context) {
        //       return {'profile', 'logout'}.map((String choice) {
        //         return PopupMenuItem<String>(
        //           value: choice,
        //           child: Text(choice),
        //         );
        //       }).toList();
        //     },
        //   ),
        // ],
      ),
      //Appbar
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      drawer: Drawer(
        backgroundColor: // Color.fromARGB(255, 238, 172, 137),
            Color.fromARGB(255, 33, 54, 68),
        child: ListView(padding: EdgeInsets.zero, children: [
          // if (image != null)
          //   UserAccountsDrawerHeader(
          //     accountName: Text('JAISEENA JOY'),
          //     accountEmail: Text('jaiseena@gmai.com'),
          //     currentAccountPicture: CircleAvatar(
          //       backgroundColor: Colors.transparent,
          //       child: ClipOval(
          //         child: Image.memory(
          //           image!,
          //           width: 130,
          //           height: 130,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //       //backgroundColor: Colors.white,
          //     ),
          //   ),
          // if (url != null)
          UserAccountsDrawerHeader(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 255, 255, 236)),
            accountName: Text(
              'Ostello',
              style: TextStyle(color: const Color.fromARGB(255, 33, 54, 68)),
            ),
            accountEmail: Text(
              'Far From Home',
              style: TextStyle(color: const Color.fromARGB(255, 33, 54, 68)),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Logo11.png'),

              // backgroundColor: Colors.transparent,
              // child: ClipOval(
              //   child: Image.network(
              //     url!,
              // width: 130,
              // height: 130,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              //backgroundColor: Colors.white,
            ),
          ),
          ListTile(
              leading: Icon(Icons.person),
              iconColor: const Color.fromARGB(255, 255, 255, 236),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              textColor: const Color.fromARGB(255, 255, 255, 236),
              // title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/ParentProfile');
              }),

          ListTile(
              leading: Icon(Icons.notifications_active),
              iconColor: const Color.fromARGB(255, 255, 255, 236),
              title: Text('Student Daily Attendance'),
              textColor: const Color.fromARGB(255, 255, 255, 236),
              onTap: () {
                Navigator.pushNamed(context, '/listAttendance');
              }),

          ListTile(
              leading: Icon(Icons.money),
              iconColor: const Color.fromARGB(255, 255, 255, 236),
              title: Text('View Mess Bill'),
              textColor: const Color.fromARGB(255, 255, 255, 236),
              onTap: () {
                Navigator.pushNamed(context, '/listMessBill');
              }),

          ListTile(
              leading: Icon(Icons.feedback_rounded),
              iconColor: const Color.fromARGB(255, 255, 255, 236),
              title: Text('Communication'),
              textColor: const Color.fromARGB(255, 255, 255, 236),
              onTap: () {
                Navigator.pushNamed(context, '/Parent_communication_tomatron');
              }),

          //      ListTile(
          //     leading: Icon(Icons.room),
          //     iconColor: const Color.fromARGB(255, 255, 255, 236),
          //     title: Text('View Rooms'),
          //      textColor: const Color.fromARGB(255, 255, 255, 236),
          //     onTap: () {
          //       Navigator.pushNamed(context, '/viewRooms');
          //     }),
          // // ListTile(
          //     leading: Icon(Icons.favorite),
          //     title: Text(''),
          //     onTap: () {
          //       // Navigator.pushNamed(context, '/edit_customer_profile');
          //     }),

          // ListTile(
          //     leading: Icon(Icons.favorite),
          //     title: Text('Notification'),
          //     onTap: () {
          //       // Navigator.pushNamed(context, '/edit_customer_profile');
          //     }),

          ListTile(
              leading: Icon(Icons.logout_rounded),
              iconColor: const Color.fromARGB(255, 243, 243, 195),
              title: Text('Logout'),
              textColor: const Color.fromARGB(255, 243, 243, 195),
              onTap: () {
                _signOut(context);
              }),
        ]),
      ),

      body: Container(
        // height: 800,
        //  width: 1000,
        decoration: new BoxDecoration(
          //  color: Color.fromARGB(255, 203, 32, 32),
          image: new DecorationImage(
              image: new AssetImage(
                'assets/images/PARENT.png',

                //'assets/images/6.jpg',
              ),
              fit: BoxFit.cover),
        ),

        child: Center(
          // body: Container(
          child: ListView(
            children: [
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

              //profile page  details.................................................

//           SizedBox(),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
//             child: TextField(
//               controller: email,
//               decoration: InputDecoration(label: Text('Email')),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: name,
//               decoration: InputDecoration(label: Text('Name')),
//             ),
//           ),

//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
//             child: TextField(
//               controller: phone,
//               keyboardType: TextInputType.number,
//               maxLength: 10,
//               decoration: InputDecoration(label: Text('Phone')),
//             ),
//           ),

// // 7)
// //           if (selectDistrict != null)
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
// //               child: DropdownButtonFormField(
// // //8)
// //                   value: selectDistrict,
// //                   decoration: InputDecoration(
// //                     label: Text('Select District'),
// //                   ),
// //                   items: district
// //                       .map((e) => DropdownMenuItem(
// //                             child: Text(e),
// //                             value: e,
// //                           ))
// //                       .toList(),
// //                   onChanged: (val) {
// //                     selectDistrict = val;
// //                   }),
// //             ),

//           // Padding(
//           //   padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
//           //   child: TextField(
//           //     controller: username,
//           //     decoration: InputDecoration(
//           //         border: OutlineInputBorder(), label: Text('Enter Username')),
//           //     keyboardType: TextInputType.name,
//           //   ),
//           // ),

//           //  Padding(
//           //    padding: const EdgeInsets.fromLTRB(20, 3, 20, 5),
//           //    child: TextField(
//           //     controller: password,
//           //      keyboardType: TextInputType.number,
//           //     maxLength: 6,
//           //        decoration: InputDecoration(
//           //           border: OutlineInputBorder(),
//           //           label: Text('Enter Password')
//           //         ),
//           //            ),
//           //  ),

//           // if(image!=null)
//           // Image.memory(
//           //   image!,
//           //   width: 100,
//           //   height: 100,
//           // ),

//           // ElevatedButton(
//           //     onPressed: () async {
//           //       final ImagePicker picker = ImagePicker();
//           //       image =
//           //           await (await picker.pickImage(source: ImageSource.gallery))
//           //               ?.readAsBytes();
//           //       setState(() {});
//           //     },
//           //     child: Text('Edit Image')),

              // ElevatedButton(
              //   onPressed: () {

              //     // Submit();
              //   },
              //   child: Text(
              //     'View products',
              //     style: TextStyle(fontSize: 20),
              //   ),
              //   style: ButtonStyle(
              //       minimumSize: MaterialStateProperty.all(Size(300, 50)),
              //       backgroundColor: MaterialStateProperty.all(Colors.green),
              //       padding: MaterialStateProperty.all(
              //         EdgeInsets.only(left: 50, right: 50),
              //       )),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
