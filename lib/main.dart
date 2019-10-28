import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animecca',
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
      home: MyHomePage(title: 'Animecca'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Container(
            color: Colors.white,
          ),
          Container(
            color: Colors.white,
          ),
          Container(
            color: Colors.white,
          )
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: Colors.orange,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_page == 0) ? Colors.black : Colors.grey),
            title: Container(height: 0.0),
            backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: (_page == 1) ? Colors.black : Colors.grey,),
            title: Container(height: 0.0),
            backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: (_page == 2) ? Colors.black : Colors.grey,),
            title: Container(height: 0.0),
            backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              color: (_page == 3) ? Colors.black : Colors.grey,),
            title: Container(height: 0.0),
            backgroundColor: Colors.white),
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
