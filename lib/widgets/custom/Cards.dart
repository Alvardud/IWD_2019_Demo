import 'package:flutter/material.dart';
import 'package:app_mujeres_aurora/strings.dart';

class Cards extends StatelessWidget {

  final bool image;
  final bool promociones;
  final String titulo;
  final String direccion;
  final String hora;
  double _tamano;

  Cards({this.hora,this.image,this.promociones,this.titulo,this.direccion});

  @override
  Widget build(BuildContext context) {

    if (promociones && image){
      _tamano=200.0;
    }else if(!promociones && image){
      _tamano=180.0;
    }else{
      _tamano=150;
    }

    Cadenas strings = Cadenas();
    if(image){
      return Container(
        margin: EdgeInsets.only(bottom: 16.0),
        height: _tamano,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(hora,style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300
            ),),
            Padding(padding: EdgeInsets.symmetric(vertical: 4.0),),
            CardElement(promociones: promociones,imagen: direccion),
          ],
        ),
      );
    }else{
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.pinkAccent,
              Colors.pink[100]
            ]),
            borderRadius: BorderRadius.circular(8.0)
        ),
        margin: EdgeInsets.only(bottom: 16.0,left: 20.0,right: 20.0),
        height: _tamano,
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: Text(strings.Obtener(0),style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
              fontWeight: FontWeight.w300
          ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}

class CardElement extends StatelessWidget {

  final String imagen;
  final bool promociones;

  CardElement({this.promociones,this.imagen});

  @override
  Widget build(BuildContext context) {

    if(promociones){
      return Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ContenedorElemento(imagen: imagen,),
              Container(height: 20.0,)
            ],
          ),
          Positioned(
            left: 150.0,
            top: 113.0,
            child: promocion(),
          )
        ],
      );
    }else{
      return ContenedorElemento(imagen:imagen);
    }
  }
}

class ContenedorElemento extends StatelessWidget {

  final String imagen;

  ContenedorElemento({this.imagen});

  Widget Contenido(){
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(7.0),
                        topRight: Radius.circular(7.0)
                    ),
                    color: Color(0xFFFF80AB).withOpacity(0.7)
                ),
                height: 35.0,
              )
            ],
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: InkWell(
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.pinkAccent),
                        bottom:BorderSide(color: Colors.pinkAccent),
                        right: BorderSide(color: Colors.pinkAccent),
                        left: BorderSide(color: Colors.pinkAccent)
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(75.0)
                ),
                child: Center(
                  child: Icon(Icons.favorite_border,color: Colors.pinkAccent,size: 30.0,),
                ),
              ),
              onTap: (){
                //TODO: cambiar el accionar del boton
              },
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    if(imagen==null){
      return Container(
        height: 144,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: Colors.pinkAccent),
            bottom: BorderSide(color: Colors.pinkAccent),
            right: BorderSide(color: Colors.pinkAccent),
            top: BorderSide(color: Colors.pinkAccent)
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Contenido(),
      );
    }else{
      return Container(
        height: 144,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imagen)),
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Contenido(),
      );
    }
  }
}

class promocion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white,width: 1.5)),
              ),
              child: Center(child: Text('25 %',style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 20.0
              ),),),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text('300 \$',style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    decoration: TextDecoration.lineThrough,
                  ),),
                  Text('225 \$',style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


