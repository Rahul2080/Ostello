import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class parentCommunication extends StatefulWidget {
  const parentCommunication({Key? key}) : super(key: key);

  @override
  State<parentCommunication> createState() => _parentCommunicationState();
}

class _parentCommunicationState extends State<parentCommunication> {
  final CollectionReference reg =
      FirebaseFirestore.instance.collection('parent_register');

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
        title: Text("Communication"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
      body: StreamBuilder(
        stream: reg.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot regsnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 4, right: 2, left: 2),
                  child: Container(
                    height: 100,
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(" Name :"),
                                  Text(
                                    regsnap['Name'],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Student Name:"),
                                  Text(
                                    regsnap['Student_name'],
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Phone:"),
                                  Text(
                                    regsnap['phone'],
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: IconButton(
                                  onPressed: () {
                                    _makePhoneCall(regsnap['phone']);
                                  },
                                  icon: Icon(Icons.phone),
                                  iconSize: 30,
                                  color: const Color.fromARGB(255, 33, 54, 68)),
                            ),
                            IconButton(
                              onPressed: () {
                                _makeWhatsAppChat(regsnap['phone']);
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
