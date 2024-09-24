import 'package:flutter/material.dart';

class rent extends StatefulWidget {
  const rent({super.key});

  @override
  State<rent> createState() => _rentState();
}

class _rentState extends State<rent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      title: Text("Rent"),foregroundColor: const Color.fromARGB(255, 255, 255, 236),
    backgroundColor:const Color.fromARGB(255, 33, 54, 68),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(1),)
      ,elevation:70,
      ),
    );
  }
}