import 'package:flutter/material.dart';
import 'package:hphp/Tutor.dart';
import './Home.dart';
import './Person.dart';
import './Case.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/second': (_) => SecondPage(
          data: 'abc',
        )
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int _selectedIndex = 0;

  final tabs = [
  HomePage(),
  CasePage(),
  TutorPage(),
  PersonPage()
  ];

  trial(){
    print("hihi");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

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
      body: tabs[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xfff5f5f5), // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首頁')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('平台導師')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('補習個案')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('個人中心'))

        ],
        currentIndex: _selectedIndex,
        fixedColor: Color(0xffffdb4d),
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SecondPage extends StatelessWidget {

final String data;

SecondPage({
  Key key,
  @required this.data,
}) : super(key: key);

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
          Text('Second Page', style: TextStyle(fontSize: 50),
          )
        ],),
      ),
    );

  }

}