import 'package:flutter/material.dart';
import'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:app_mujeres_aurora/screens/Home.dart';
import'package:flutter/services.dart';
import 'package:app_mujeres_aurora/screens/Favourite.dart';
import 'package:app_mujeres_aurora/screens/Search.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.purple[300]));
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
  final Color accent=Colors.purpleAccent;
  final Color primario=Colors.purple[300];


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
              icon: Icon(Icons.home,color: accent,),
              title: Text('Home',style: TextStyle(color:Colors.white)),
              activeColor: primario,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.search,color: accent,),
                title: Text('Search',style: TextStyle(color:Colors.white)),
                activeColor: primario,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.favorite,color: accent,),
                title: Text('Favourite',style: TextStyle(color:Colors.white),),
                activeColor: primario,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.star,color: accent,),
                title: Text('Sugerencias',style: TextStyle(color:Colors.white)),
                activeColor: primario,
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
            Search(),
            Favourite(),
            Container(),
          ],
        ),
      )
    );
  }
}