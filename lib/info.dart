








import 'package:flutter/material.dart';

class my_crush extends StatelessWidget {
  const my_crush({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Text(
                "gunda team",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: AutofillHints.birthday,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 5,
                    wordSpacing: 5,
                    backgroundColor: Color.fromARGB(31, 243, 240, 240),
                    shadows: [
                      Shadow(
                          color: Colors.black38,
                          offset: Offset(4, 0),
                          blurRadius: 2),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 60),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "first name",
                      hintText: "enter first name",
                      prefixIcon: Icon(Icons.account_circle),
                      suffixIcon: Icon(Icons.swap_vertical_circle)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 60),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "user name",
                      hintText: "enter user name",
                      prefixText: "mr. ",
                      suffixText: "hello"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 60),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "user name",
                      hintText: "enter user name",
                      helperText: "enter your user name",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(38, 0, 4, 32)),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 51, 1, 231),
                          fontStyle: FontStyle.italic)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 60),
                child: TextField(
                  decoration: InputDecoration(labelText: "password"),
                  maxLength: 6,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30, right: 40),
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 139, 19, 109),
                          width: 5,
                        ),
                      ),
                      label: Text(AutofillHints.username)),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.brown,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
