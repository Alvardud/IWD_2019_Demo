import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {

  final bool avatar;
  final String titulo;
  final Color color;

  Titulo({this.titulo,this.color,this.avatar});

  @override
  Widget build(BuildContext context) {

    if(avatar){
      return Container(
        color: color,
        height: 70.0,
        //color: Colors.pink[200],
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                    icon: Icon(Icons.account_circle,size: 30.0,color: Colors.black54,),
                    onPressed: (){
                      //TODO: llevar al drawer
                    }
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(titulo,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }else{
      return Container(
        color: color,
        height: 70.0,
        //color: Colors.pink[200],
        width: MediaQuery.of(context).size.width,
        child: Center(
                  child: Text(titulo,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              );
    }
  }
}
