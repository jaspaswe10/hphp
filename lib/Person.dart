import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget{

  List TitleName = ['關於我們','服務條款','隱政政策','關於我們', '登出'];

  @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('個人中心'),
          backgroundColor:Color(0xffffdb4d),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: EdgeInsets.all(5.0),
              height: 65.0,
              width: 200.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(TitleName[index]),
                  Icon(Icons.add_alert)
                ],

              ),
            );
          },
        )
      );
    }
}