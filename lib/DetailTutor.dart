import 'package:flutter/material.dart';

class DetailTutor extends StatefulWidget {
  @override
  _DetailTutorState createState() => _DetailTutorState();
}

class _DetailTutorState extends State<DetailTutor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Info'),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: Row(
            children: <Widget>[
            Column(
              children: <Widget>[
                Text(r'HK $150 / HOUR', style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w700),),
                Text('data')
              ],
            ),
              Container(
                color: Colors.red,
                height: 30.0,
                width: 30.0,
              )
            ],
          ),
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(
                        color: Color.fromRGBO(220, 220, 220, 1),
          blurRadius: 10.0,
          spreadRadius: 0.1,
          offset: Offset(.0, 0.0)
            )]
          ),
        ),
      )
    );
  }
}