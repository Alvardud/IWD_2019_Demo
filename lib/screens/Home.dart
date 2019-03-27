import 'package:flutter/material.dart';
import 'package:app_mujeres_aurora/widgets/common/common.dart';
import 'package:app_mujeres_aurora/widgets/custom/CardFlipper.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Titulo(titulo: 'Mi Agenda'),
          TotalPago(color:Colors.white),
          Expanded(child:CardsContainer()),
          punteroFecha(color:Colors.white),
        ],
      ),
    );
  }
}

class TotalPago extends StatelessWidget {

  final Color color;

  TotalPago({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
        //border: Border(bottom: BorderSide(color: Colors.black54)),
        boxShadow: [
          //TODO: sombra tipo elevacion
          BoxShadow(
          color: Colors.grey[300],
          //spreadRadius: 10.0,
          offset: Offset(0.0, 4.0),
          blurRadius: 3.0,
        )
        ],
      ),

      child: Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: Texto(),),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0)
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
                child: Text('Administrar',style: TextStyle(
                  color: Colors.blue,
                  //decoration: TextDecoration.underline,
                ),),
              ),
              onTap: (){
                //TODO: lleva a la pantalla de administrar gastos
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Texto extends StatefulWidget {
  @override
  _TextoState createState() => _TextoState();
}

class _TextoState extends State<Texto> {

  String texto='Total a pagar hoy: ';
  double gasto;

  @override
  void initState() {
    // TODO: implement initState
    gasto=0.0;
  }

  double getGasto(){
    //TODO: llenar mediante la sumatoria de los costos de sus servicios

    setState(() {
      gasto=gasto;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Text(texto+"${gasto.toString()} Bs.",style: TextStyle(
      fontSize: 16.0
    ),);
  }
}

class punteroFecha extends StatefulWidget {

  final Color color;

  punteroFecha({this.color});

  @override
  _punteroFechaState createState() => _punteroFechaState(color: color);
}

class _punteroFechaState extends State<punteroFecha> {

  final Color color;
  String fecha;
  String diaAnterior='Domingo';
  int fechaAnterior=24;
  String diaPosterior='Martes';
  int fechaPosterior=26;

  _punteroFechaState({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.arrow_back_ios,size: 20.0,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 2.0),),
                  Text(diaAnterior+", "+fechaAnterior.toString())
            ],
          ),
          Expanded(child: Container(),),
              Row(
                children: <Widget>[

              Text(diaPosterior+", "+fechaPosterior.toString()),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2.0),),
              Icon(Icons.arrow_forward_ios,size: 20.0,),
            ],
          )
        ],
      ),
    );
  }
}

class CardsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        /*gradient: RadialGradient(
        colors: [
          Colors.pink[50],
          Colors.pink[100],
        ])*/
      ),
      child: CardFlipper(),
    );
  }
}
