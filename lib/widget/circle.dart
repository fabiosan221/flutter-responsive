import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  //Variable para tamaño del circulo
  final double size;

  //Variable para lista de colores
  final List<Color> colors;

  //Constructor del circulo
  //Se agrega la directiva required para que el campo size sea obligatorio
  const Circle({super.key, required this.size, required this.colors})
      //Se agrega validación a travez de un assert
      : assert(size != null && size > 0),
        assert(colors != null && colors.length >= 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Se define el tamaño del circulo
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
          //Se establece el color de la figura y la dirección del gradiente
          gradient: LinearGradient(
              colors: this.colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          //Se establece la forma de la figura
          shape: BoxShape.circle),
    );
  }
}
