
import 'package:flutter/material.dart';

class buttonwidget extends StatelessWidget {
  const buttonwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 60),
              child: TextButton(
                  style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 20,
                      )),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.purpleAccent)),
                  onPressed: () {},
                  child: Text('submit')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 20, right: 60),
              child: TextButton.icon(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 20,
                    )),
                    foregroundColor:
                        MaterialStateProperty.all(Colors.purpleAccent)),
                onPressed: () {},
                icon: Icon(Icons.home),
                label: Text("Exit"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 60, top: 60),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('submit', style: TextStyle(fontSize: 30)),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.limeAccent),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 15, 89, 53)),
                  minimumSize: MaterialStateProperty.all(Size(20, 50)),
                  // textStyle:
                  //     MaterialStateProperty.all(TextStyle(fontSize: 30)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 60, top: 60),
              child: OutlinedButton(
                  style: ButtonStyle(
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 30)),
                    foregroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 4, 68, 6)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 247, 224, 22)),
                    maximumSize: MaterialStateProperty.all(Size(200, 40)),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.redAccent, width: 2)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                  ),
                  onPressed: () {},
                  child: Text('exit')),
            )
          ],
        ),
      ),
    );
  }
}
