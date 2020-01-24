import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hphp/DetailTutor.dart';

import 'models/tutor.dart';

class CasePage extends StatefulWidget {
  @override
  _CasePageState createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
  final DatabaseReference database =
      FirebaseDatabase.instance.reference().child("test");

      List<Tutor> tutorList = [];

      @override 
      void initState(){
        super.initState();

        DatabaseReference tutorRef = FirebaseDatabase.instance.reference().child("HoopTutors");

        tutorRef.once().then((DataSnapshot snap)
        {
          var KEYS = snap.value.keys;
          var DATA = snap.value;

          tutorList.clear();

          for(var individualKey in KEYS)
          {
            Tutor tutor = new Tutor(
              chinesename: DATA[individualKey]['中文姓名'],
              nickname: DATA[individualKey]['稱呼'],
              gender: DATA[individualKey]['導師性別'],
              university: DATA[individualKey]['導師就讀院校'],
              form: DATA[individualKey]['導師學歷'],
              fee: DATA[individualKey]['時薪'],
              major: DATA[individualKey]['主修科目'],
              tutorregion: DATA[individualKey]['科目'],
              tutorsubject: DATA[individualKey]['科目'],
              tutorexperience: DATA[individualKey]['教導經驗'],
              performance: DATA[individualKey]['公開試成績'],
              thingtospeak: DATA[individualKey]['自我介紹'],
              score: DATA[individualKey]['個案編號'],

            );
            tutorList.add(tutor);
          }

          setState(() {
          });
        });
      }

  sendData() {
    database.push().set({'name': 'Peter', 'lastName': 'Ross'});

    print('on9');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('平台導師'),
        backgroundColor: Color(0xffffdb4d),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_alert),
            color: Colors.white,
            onPressed: () => {},
          )
        ],

      ),
      body: Column(
        children: <Widget>[
                    SizedBox(
            height: 10.0,
          ),
          Container(
            height: 60.0,
            width: 330.0,
            decoration: BoxDecoration(
              color: Color(0xffffdb4d),
              borderRadius: BorderRadius.all(Radius.circular(30.0))
            ),

          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: tutorList.length == 0 ? new Text("No tutor available") : new ListView.builder(
              itemCount: tutorList.length,
              itemBuilder: (_, index){
                return PostsUI(tutorList[index].nickname, tutorList[index].gender, tutorList[index].university, tutorList[index].major, tutorList[index].tutorsubject, tutorList[index].tutorexperience, tutorList[index].score, tutorList[index].fee, tutorList[index].tutorsubject);
              },
            ),
          ),
        ],
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => sendData,
      child: Icon(Icons.filter_list),
      backgroundColor: Color(0xffffdb4d),
    ),
    
    );
  }

  Widget PostsUI(String nickname, String gender, String university, String major, String tutorsubject, String experience, String score, String fee, String tutrsubject)
  {
    return new Container(
      margin: EdgeInsets.all(8.0), //外
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [BoxShadow(
          color: Color.fromRGBO(220, 220, 220, 1),
          blurRadius: 10.0,
          spreadRadius: 0.1,
          offset: Offset(.0, 0.0)
        )],
      ),
      child: new GestureDetector(
        onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTutor()),);
        },
              child: new Container(
          padding: EdgeInsets.all(14.0), //內
          child: Row(
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(nickname, style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600, color: Color.fromRGBO(226, 211, 1, 1)),),
                    SizedBox(width: 10.0,),
                    Icon(Icons.person, color: gender  == "男"? Colors.blue : Colors.red,)
                  ],
                ),
                  SizedBox(height: 6.0,),
                      Text(university+" 主修"+major, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),),
                      Text(tutorsubject, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),),
                      Text(r"HK $"+fee+" / HOUR", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),)

                ],
              ),
              new Column(
                children: <Widget>[
                  Text(fee+'h')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
