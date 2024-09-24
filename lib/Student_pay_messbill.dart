import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Student_pay_messbill extends StatefulWidget {
  const Student_pay_messbill({Key? key}) : super(key: key);

  @override
  State<Student_pay_messbill> createState() => _Student_pay_messbillState();
}

class _Student_pay_messbillState extends State<Student_pay_messbill> {
  final CollectionReference pay =
      FirebaseFirestore.instance.collection('pay_messbill');

  TextEditingController Email = TextEditingController();
  TextEditingController Date = TextEditingController();
  TextEditingController Total_amnt = TextEditingController();
  TextEditingController Per_head_amnt = TextEditingController();
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
      'Total_amnt': double.parse(Total_amnt.text), // Parse to double
      'Per_head_amnt': Per_head_amnt.text,
      // 'pdesc': Pdesc.text,
      // 'amount': (double.parse(Amount.text) * quantity)
      //     .toString(), // Update amount based on quantity
      // 'status': "Confirmed",
      //'date': Timestamp.now(),
    };
    pay.add(data);
    // Example UPI ID - replace with actual UPI ID
    String upiUrl =
        'upi://pay?pa=egopi2007@okicici&pn=YourStoreName&tn=Purchase&am=${Per_head_amnt.text}&cu=INR';
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
    Total_amnt.text = args['Total_amnt'];
    Per_head_amnt.text = args['Per_head_amnt'];
    // farmerEmail = args['email'];

    double totalPrice = double.parse(Per_head_amnt.text);
    // * quantity; // Calculate total price

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mess Bill Details",
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
                        'Total_amnt:',
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
                          args['Total_amnt'],
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 25),
                      child: Text(
                        'Per_head_amnt:',
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
                          left: 100,
                        ),
                        child: Text(
                          args['Per_head_amnt'],
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Total Amount: $totalPrice', // Display total amount
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

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
