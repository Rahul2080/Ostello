
import 'package:flutter/material.dart';

class ostello extends StatelessWidget {
  const ostello({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/hostal.jpg',
              height: 200,
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
