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
            CardElement(promociones: promociones,imagen: direccion,titulo: titulo,),
          ],
        ),
      );
    }else{
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.purple[100]
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
  final String titulo;

  CardElement({this.promociones,this.imagen,this.titulo});

  @override
  Widget build(BuildContext context) {

    if(promociones){
      return Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ContenedorElemento(imagen: imagen,titulo: titulo,),
              Container(height: 20.0,)
            ],
          ),
          Positioned(
            right: 8.0,
            top: 113.0,
            child: promocion(),
          )
        ],
      );
    }else{
      return ContenedorElemento(imagen:imagen,titulo: titulo,);
    }
  }
}

class ContenedorElemento extends StatefulWidget {

  final String imagen;
  final String titulo;

  ContenedorElemento({this.imagen,this.titulo});
  
  @override
  _ContenedorElementoState createState() => _ContenedorElementoState(imagen: imagen,titulo: titulo);
}

class _ContenedorElementoState extends State<ContenedorElemento> {

  final String imagen;
  final Color accent=Colors.purpleAccent;
  IconData _icono=Icons.favorite_border;
  final String titulo;

  _ContenedorElementoState({this.imagen,this.titulo});

  Widget Contenido(){
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                height: 35.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(7.0),
                        topRight: Radius.circular(7.0)
                    ),
                    color: Colors.black38.withOpacity(0.7)
                ),
                child: Text(titulo,style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
                ),),
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
                        top: BorderSide(color: accent),
                        bottom:BorderSide(color: accent),
                        right: BorderSide(color: accent),
                        left: BorderSide(color: accent)
                    ),
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(75.0)
                ),
                child: Center(
                  child: Icon(_icono,color: accent,size: 25.0,),
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
            left: BorderSide(color: accent),
            bottom: BorderSide(color: accent),
            right: BorderSide(color: accent),
            top: BorderSide(color: accent)
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Contenido(),
      );
    }else{
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          height: 144,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(imagen)),
              borderRadius: BorderRadius.circular(8.0)
          ),
          child: Contenido(),
        ),
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


