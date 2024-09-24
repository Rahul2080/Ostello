// import 'dart:ffi';

import 'package:cs/login.dart';
import 'package:cs/user_interface.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      // backgroundColor:const Color.fromARGB(255, 33, 54, 68),
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(30),)
      //   ,elevation:70,),
      backgroundColor: Color.fromARGB(255, 33, 54, 68),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 300, left: 30, right: 30),
              child: Image.asset(
                'assets/images/Logo11.png',
                height: 250,
                width: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.of(context as BuildContext)
        .push(MaterialPageRoute(builder: (ctx) => Userinterface()));
  }
}
