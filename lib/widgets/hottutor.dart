import 'package:flutter/material.dart';
import 'package:hphp/models/tutor.dart';

class HotTutor extends StatefulWidget {
  @override
  _HotTutorState createState() => _HotTutorState();
}

class _HotTutorState extends State<HotTutor> {
  @override
  Widget build(BuildContext context) {
    return Container(
height: 210.0,
color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            width: 160.0,
            height: 90.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Colors.green,
            ),
            margin: EdgeInsets.only(top:8.0, bottom: 8.0, left: 8.0, right: 8.0),
            child: Column(
              children: <Widget>[
                Image(image: AssetImage('assets/images/fw.jpg'),),
                Text(favorites[index].nickname),
                Text(favorites[index].university),
                Text(favorites[index].tutorsubject)
              ],
            ),
          );

        }

      ),
      
    );
  }
}