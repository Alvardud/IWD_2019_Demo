import 'package:flutter/material.dart';
import 'package:app_mujeres_aurora/widgets/custom/Cards.dart';

class ListHome extends StatelessWidget{

  int fecha;
  String dia='Lunes';

  ListHome({this.fecha});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4.0,
            spreadRadius: 1.0
          )
        ]
      ),
      padding: EdgeInsets.only(top:8.0,right: 8.0,left: 8.0,bottom: 4.0),
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8.0),
            child: Text(dia+" "+fecha.toString(),style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 25.0,
          ),),),
          //Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
          Lista(),
        ],
      ),
    );
  }
}

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: MediaQuery.of(context).size.height-301,
      child: ListView(
        //physics: ScrollPhysics(),
        children: <Widget>[
          Cards(image: false,promociones: false,),
          Cards(hora: '15:30',image: true,promociones: false,),
          Cards(hora: '17:30',image: true,promociones: false,),
          Cards(hora: '18:00',image: true,promociones: true,),
          Cards(hora: '21:00',image: true,promociones: false,),
        ],
      ),
    );
  }
}

