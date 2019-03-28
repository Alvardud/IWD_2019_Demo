import 'package:flutter/material.dart';
import 'package:app_mujeres_aurora/widgets/common/common.dart';


class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Titulo(titulo: 'Search',avatar:false),
          Buscador(),
          //ResultadosBusqueda(),
        ],
      ),
    );
  }
}

class Buscador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 76.0,
      //color: Colors.grey,
      padding: EdgeInsets.only(top:2.0,bottom:16.0,right: 16.0,left: 16.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black54,
            blurRadius: 2.0,
            spreadRadius: 0.5,
          ),],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0)
        ),
        padding: EdgeInsets.symmetric(horizontal:8.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Escritor(),),
            Center(
              child: IconButton(
                  icon: Icon(Icons.settings,color: Colors.black54,size: 25.0,),
                  onPressed: (){}),
            )
          ],
        ),
      ),
    );
  }
}

class Escritor extends StatefulWidget {
  @override
  _EscritorState createState() => _EscritorState();
}

class _EscritorState extends State<Escritor> {
  @override

  String _inicial;
  String result="";
  TextEditingController _controller = TextEditingController();

  initState(){
    _inicial='Search';
  }

  String _calculate(){
    String _result = _controller.text;
    if(_result == ''){
      return _inicial;
    }else{
      return _result;
    }
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:8.0),
      child: TextField(
        controller: _controller,
        onChanged: (String s){
          setState(() {
            result=_calculate();
          });
        },
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 0.0),
            labelStyle: TextStyle(fontSize: 20.0),
            labelText: _inicial,
            hasFloatingPlaceholder: false,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
        ),
        //keyboardType: TextInputType.number,
      ),
    );
  }
}

