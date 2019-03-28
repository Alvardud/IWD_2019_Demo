import 'package:flutter/material.dart';
import 'package:app_mujeres_aurora/widgets/custom/Cards.dart';

class ListHome extends StatelessWidget{

  final int fecha;
  final String dia;

  ListHome({this.fecha,this.dia});

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
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Cards(image: false,promociones: false,),
          Cards(
            hora: '15:30',
            image: true,
            promociones: false,
            titulo: 'No limits',
            direccion: 'assets/gimnasio.jpeg',),
          Cards(
            hora: '16:30',
            image: true,
            promociones: false,
            titulo: 'La vie en Rose SPA',
            direccion: 'assets/spa.jpeg',),
          Cards(
            hora: '18:00',
            image: true,
            promociones: true,
            titulo: 'Salon de Belleza Exotica',
            direccion: 'assets/maquillaje.png',),
          Cards(
            hora: '21:00',
            image: true,
            promociones: false,
            titulo: 'Chalet La Suisse',
            direccion: 'assets/restaurant.jpeg',),
        ],
      ),
    );
  }
}

