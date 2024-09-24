import 'package:cs/add_rooms.dart';
import 'package:cs/rooms.dart';
import 'package:cs/list.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  const Rooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Home"),
    backgroundColor:const Color.fromARGB(255, 81, 110, 36),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),)
      ,elevation:70,),
      backgroundColor: Color.fromARGB(255, 255, 255, 236),
     body:


      ListView(
        children: [
          Column(
            children: [
      // children: [
       Padding(
         padding: const EdgeInsets.only(left: 20,right: 20,top: 250),
         child: ElevatedButton(onPressed: () {
         Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => AddRooms()));
         }, child: Text("Add Rooms",style: TextStyle(fontSize: 20),
         ),
         style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 236)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 33, 54, 68)),
                        minimumSize: MaterialStateProperty.all(Size(20, 50),
                        ),),
         ),
       ),
     
      Padding(
       padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
       child: ElevatedButton(onPressed: () {  
          Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => ListRooms()));}, child: Text("View Rooms",style: TextStyle(fontSize: 20),
         ),
         style: ButtonStyle(foregroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 236)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 33, 54, 68)),
                        minimumSize: MaterialStateProperty.all(Size(20, 50),
                        ),
                        ),
         ),
     ),
         ],
          ),
          ],
          ),
     
     

     );
     
  }
}