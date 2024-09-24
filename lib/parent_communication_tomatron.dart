import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class parent_communication_tomatron extends StatefulWidget {
  const parent_communication_tomatron({Key? key}) : super(key: key);

  @override
  State<parent_communication_tomatron> createState() =>
      _parent_communication_tomatronState();
}

class _parent_communication_tomatronState
    extends State<parent_communication_tomatron> {
  final CollectionReference regi =
      FirebaseFirestore.instance.collection('matron_register');

  void _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    try {
      await launch(phoneUri.toString());
    } catch (e) {
      throw 'Could not launch $phoneUri';
    }
  }

  void _makeWhatsAppChat(String phoneNumber) async {
    final Uri whatsappUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: '/$phoneNumber',
    );

    try {
      await launch(whatsappUri.toString());
    } catch (e) {
      throw 'Could not launch $whatsappUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Communicate with Matron"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      body: StreamBuilder(
        stream: regi.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot regisnap = snapshot.data.docs[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " Name:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Matron Name:",
                                style: TextStyle(),
                              ),
                              Text(
                                "Phone:",
                                style: TextStyle(),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              regisnap['Name'],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              regisnap['email'],
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              regisnap['phone'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _makePhoneCall(regisnap['phone']);
                              },
                              icon: Icon(Icons.call),
                              iconSize: 30,
                              color: const Color.fromARGB(255, 33, 54, 68),
                            ),
                            IconButton(
                              onPressed: () {
                                _makeWhatsAppChat(regisnap['phone']);
                              },
                              icon: Icon(Icons.chat_bubble),
                              iconSize: 30,
                              color: const Color.fromARGB(255, 33, 54, 68),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
