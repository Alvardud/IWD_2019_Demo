
class Cadenas{
  List<String> lista = List();

  Cadenas(){
    lista.add('Reunion a las 15:00\ncon la \nDr. Fernandez');
    lista.add('Cita medica\na las 17:00');
  }

  String Obtener(int i){
    return lista[i];
  }
}



