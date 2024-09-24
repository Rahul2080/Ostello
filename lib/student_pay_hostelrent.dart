import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Student_pay_hostelrent extends StatefulWidget {
  const Student_pay_hostelrent({super.key});

  @override
  State<Student_pay_hostelrent> createState() => _Student_pay_hostelrentState();
}

class _Student_pay_hostelrentState extends State<Student_pay_hostelrent> {
  final CollectionReference hostelpay =
      FirebaseFirestore.instance.collection('pay_hostelrent');

  TextEditingController Email = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController Amount = TextEditingController();
  //TextEditingController Per_head_amnt = TextEditingController();
  //String farmerEmail = "";
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    init();
  }

  // 5)
  void init() async {
    var result = await FirebaseFirestore.instance
        .collection("register")
        .where("uid", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (result.docs.length == 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" not found")));
    } else {
      var user = result.docs.first.data();

      //  name.text = user['username'];
      Email.text = user['email'];

      setState(() {});
    }
  }

  void Submit() async {
    final data = {
      'email': Email.text,
      'Date': Date.text,
      'Amount': double.parse(Amount.text), // Parse to double
      // 'Per_head_amnt': Per_head_amnt.text,
      // 'pdesc': Pdesc.text,
      // 'amount': (double.parse(Amount.text) * quantity)
      //     .toString(), // Update amount based on quantity
      // 'status': "Confirmed",
      //'date': Timestamp.now(),
    };
    hostelpay.add(data);
    // Example UPI ID - replace with actual UPI ID
    String upiUrl =
        'upi://pay?pa=egopi2007@okicici&pn=YourStoreName&tn=Purchase&am=${Amount.text}&cu=INR';
    try {
      await launchUrl(Uri.parse(upiUrl));
    } catch (e) {
      upiUrl = upiUrl.replaceAll("upi", "phonepe");
      try {
        await launchUrl(Uri.parse(upiUrl));
      } catch (e) {
        upiUrl = upiUrl.replaceAll("phonepe", "tez");
        try {
          await launchUrl(Uri.parse(upiUrl));
        } catch (e) {
          upiUrl = upiUrl.replaceAll("tez", "paytmmp");
          try {
            await launchUrl(Uri.parse(upiUrl));
          } catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.toString())));
          }
        }
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment successfully!')),
    );
  }

  // int quantity = 1; // Variable to hold the quantity value

  // void increaseQuantity() {
  //   setState(() {
  //     quantity++;
  //   });
  // }

  // void decreaseQuantity() {
  //   if (quantity > 1) {
  //     setState(() {
  //       quantity--;
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    //email.text = args['email'];
    Date.text = args['Date'];
    Amount.text = args['Amount'];
    //Per_head_amnt.text = args['Per_head_amnt'];
    // farmerEmail = args['email'];

    double totalPrice = double.parse(Amount.text);
    // * quantity; // Calculate total price

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pay Hostel Rent ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
        ),
        elevation: 15,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                // ... (rest of your existing UI code)

                // Container(
                //   child: CircleAvatar(
                //     backgroundColor: Color.fromARGB(255, 41, 92, 43),
                //     radius: 50,
                //     child: ClipOval(
                //       child: Image.network(args['url'], height: 70, width: 70),
                //     ),
                //   ),
                // ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 75, left: 25),
                      child: Text(
                        'Date :',
                        style: TextStyle(
                            fontSize: 25, fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 75,
                          right: 25,
                          left: 50,
                        ),
                        child:
                            // TextField(
                            //   controller: Name,
                            //   decoration: InputDecoration(
                            //       border: OutlineInputBorder(), hintText: 'Enter Name'),
                            // ),
                            Text(
                          args['Date'],
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                        //   Text(
                        //   args['url'],
                        //   style: TextStyle(
                        //       fontSize: 20, fontStyle: FontStyle.italic),
                        // ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 25),
                      child: Text(
                        'Amount:',
                        style: TextStyle(
                            fontSize: 25, fontStyle: FontStyle.italic),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          right: 25,
                          left: 50,
                        ),
                        child: Text(
                          args['Amount'],
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(top: 30, left: 25),
                //       child: Text(
                //         'Per_head_amnt:',
                //         style: TextStyle(
                //             fontSize: 25, fontStyle: FontStyle.italic),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.only(
                //           top: 30,
                //           right: 25,
                //           left: 100,
                //         ),
                //         child: Text(
                //           args['Per_head_amnt'],
                //           style: TextStyle(
                //               fontSize: 20, fontStyle: FontStyle.italic),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     IconButton(
                //       icon: Icon(Icons.remove),
                //       onPressed: decreaseQuantity,
                //     ),
                //     Text(
                //       '$quantity',
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     IconButton(
                //       icon: Icon(Icons.add),
                //       onPressed: increaseQuantity,
                //     ),
                //   ],
                // ),

                // Total Amount Section
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 20),
                //   child: Text(
                //     'Total Amount: $totalPrice', // Display total amount
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 80),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        minimumSize: MaterialStateProperty.all(Size(150, 50)),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 10),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 33, 54, 68),
                        ),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Submit();
                      },
                      child: Text("Pay"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
