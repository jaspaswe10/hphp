import 'package:flutter/material.dart';
import 'package:hphp/models/tutor.dart';

class TutorIntro extends StatefulWidget {
  @override
  _TutorIntroState createState() => _TutorIntroState();
}

class _TutorIntroState extends State<TutorIntro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 490.0,
      color: Colors.white,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index){
          final Tutor favorite = favorites[index];
          return Container(
            margin: EdgeInsets.only(top:5.0, bottom: 5.0, right: 12.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(color: Color(0xFFFFEFEE),borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(radius: 35.0, backgroundColor: Colors.grey,),
                    SizedBox(width: 10.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(favorite.nickname, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.blueGrey),),
                      SizedBox(height: 3.0,),
                      Text(favorite.university, style: TextStyle(color: Colors.black,fontSize: 13.0),),
                      Text(favorite.tutorsubject, style: TextStyle(color: Colors.black, fontSize: 13.0),),

                    ],
                  )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                      Icon(Icons.star, size: 15.0,color: Colors.blueAccent),
                       Text(favorite.score+'/5')
                    ],),

                  Text(favorite.fee, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17.0),),

                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}