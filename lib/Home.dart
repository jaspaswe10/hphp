import 'package:flutter/material.dart';
import 'package:hphp/widgets/hottutor.dart';
import 'package:hphp/widgets/search.dart';
import 'package:hphp/widgets/tutorintro.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('HOOP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),),
              background: Image.network("https://cdn.civitatis.com/francia/paris/guia/torre-eiffel-grid-m.jpg",fit: BoxFit.cover,),
            ),
          ), SliverFillRemaining(
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              SearchTextField(),
              Container(
                height: 210.0,
                width: 390.0,
                color: Colors.grey,
                margin: EdgeInsets.only(top:15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Image(image: AssetImage('assets/images/tutorplace.jpg'),width: 200.0,)
                  ],
                ),
              ),
              Text('熱門導師', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),),
              HotTutor(),
              TutorIntro(),
              ]
              ),
            ),
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Jasper See"),
                
                accountEmail: new Text("jaspaswe10@gmail.com"),
                currentAccountPicture: new GestureDetector(
                  onTap: () => print("object"),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage("https://i.pinimg.com/originals/2e/8f/7c/2e8f7c73537e7246dc5a47769de2701d.jpg"),
                  ),
                ),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new NetworkImage("https://cdn.civitatis.com/francia/paris/guia/torre-eiffel-grid-m.jpg")
                  )
                ),
              ),
            new ListTile(
              title: new Text("First Page"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pushNamed('/second');

              },
            ),
                        new ListTile(
              title: new Text("Second Page"),
              trailing: new Icon(Icons.arrow_right),
            ),
            new Divider(),
                        new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.cancel),
            )
          ],
        )
      ),
    );
  }
}
