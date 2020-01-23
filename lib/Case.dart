import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

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
            print('Length: $tutorList.length');
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
            onPressed: () => print('gg'),
          )
        ],

      ),
      body: Container(
        child: tutorList.length == 0 ? new Text("No tutor available") : new ListView.builder(
          itemCount: tutorList.length,
          itemBuilder: (_, index){
            return PostsUI(tutorList[index].nickname, tutorList[index].gender, tutorList[index].university, tutorList[index].major, tutorList[index].tutorsubject, tutorList[index].tutorexperience, tutorList[index].score, tutorList[index].fee, tutorList[index].tutorsubject);
          },
        ),
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
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new Container(
        padding: EdgeInsets.all(14.0),
        child: Row(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Row(
                children: <Widget>[
                  Text(nickname, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),),
                  SizedBox(width: 10.0,),
                  Icon(Icons.person)
                ],
              ),
                SizedBox(height: 8.0,),
                    Text(university+" 主修"+major, style: TextStyle(fontSize: 12.0),),
                    Text(tutorsubject, style: TextStyle(fontSize: 12.0),)

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
    );
  }
}
