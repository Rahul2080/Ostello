import 'package:cs/Mess.dart';
import 'package:cs/hostel_rentlist.dart';
import 'package:cs/mess_bill_list.dart';
import 'package:cs/rent.dart';
import 'package:flutter/material.dart';

class Fee extends StatefulWidget {
  const Fee({super.key});

  @override
  State<Fee> createState() => _FeeState();
}

class _FeeState extends State<Fee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fees"),
        foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: Color.fromARGB(255, 33, 54, 68),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        elevation: 70,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(padding: const EdgeInsets.only(top: 230)),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      minimumSize: MaterialStateProperty.all(Size(150, 80)),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 33, 54, 68))),
                  onPressed: () {
                    Navigator.of(context as BuildContext)
                        .push(MaterialPageRoute(builder: (ctx) => Hostel_rentlist()));
                  },
                  icon: Icon(Icons.money,
                      color: Color.fromARGB(255, 255, 255, 236)),
                  label: Text(
                    "Rent",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 236)),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: ElevatedButton.icon(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        minimumSize: MaterialStateProperty.all(Size(150, 80)),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 33, 54, 68))),
                    onPressed: () {
                      Navigator.of(context as BuildContext).push(
                          MaterialPageRoute(builder: (ctx) => ListMessBill()));
                    },
                    icon: Icon(
                      Icons.money,
                      color: Color.fromARGB(255, 255, 255, 236),
                    ),
                    label: Text(
                      "Mess Bill",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 236)),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
