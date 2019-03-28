import 'package:flutter/material.dart';
import 'package:app_mujeres_aurora/widgets/common/common.dart';


class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Titulo(titulo: 'Favourite',avatar:false),
          Container()
        ],
      ),
    );
  }
}