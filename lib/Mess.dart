import 'package:flutter/material.dart';

class mess extends StatefulWidget {
  const mess({super.key});

  @override
  State<mess> createState() => _messState();
}

class _messState extends State<mess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Mess Bill"),foregroundColor: Color.fromARGB(255, 255, 255, 236),
        backgroundColor: const Color.fromARGB(255, 33, 54, 68),
      ),
    );
  }
}