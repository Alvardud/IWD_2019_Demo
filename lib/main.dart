import 'package:flutter/material.dart';
import'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:app_mujeres_aurora/screens/Home.dart';
import'package:flutter/services.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.pink[300]));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatefulWidget {
  @override
  _CuerpoState createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> with SingleTickerProviderStateMixin {

  TabController _tabController;
  int _index;

  @override
  void initState() {
    // TODO: implement initState
    _index = 0;
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home,color: Colors.pinkAccent,),
              title: Text('Home',style: TextStyle(color:Colors.white)),
              activeColor: Colors.pink[300],
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.search,color: Colors.pinkAccent,),
                title: Text('Search',style: TextStyle(color:Colors.white)),
                activeColor: Colors.pink[300],
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.favorite,color: Colors.pinkAccent,),
                title: Text('Favourite',style: TextStyle(color:Colors.white),),
                activeColor: Colors.pink[300],
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.star,color: Colors.pinkAccent,),
                title: Text('Sugerencias',style: TextStyle(color:Colors.white)),
                activeColor: Colors.pink[300],
            ),
          ],
          onItemSelected: (index) => setState(() {
            _index = index;
            _tabController.animateTo(_index);
          })),
      body: Padding(padding: EdgeInsets.only(top: 20.0),
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: <Widget>[
            Home(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      )
    );
  }
}