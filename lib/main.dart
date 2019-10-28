import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main_map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animecca',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Animecca'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

PageController pageController;

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: MainMap(),
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
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
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
        onTap: navigationTapped,
        currentIndex: _page,
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged (int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
