import 'package:flutter/material.dart';

//Se importa la libreria flutter_svg
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  //Variable para tamaño del avatar
  final double size;

  //Constructor del avatar
  //Se agrega la directiva required para que el campo size sea obligatorio
  const IconContainer({super.key, required this.size})
      //Se agrega validación a traves de un assert
      : assert(size != null && size > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Tamaño del contenedor 110 x 110 pixeles
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
          //Color de fondo
          color: Colors.white,
          //Bordes redondeados del contenedor del icono
          //El tamaño esta dado configurado para que sea el 15 porciento
          //de la medida del icono
          borderRadius: BorderRadius.circular(this.size * 0.15),
          //Parametros de la sombra
          boxShadow: const [
            BoxShadow(
                //Color
                color: Colors.black26,
                //Difuminacion
                blurRadius: 20,
                //Posicion de la sombra
                offset: Offset(0, 10)),
          ]),
      padding: EdgeInsets.all(this.size * 0.15),
      //Se utiliza un widget Center para posicionar el icono
      child: Center(
        child: SvgPicture.asset(
          'assets/icon.svg',
          //Tamaño del icono
          width: this.size * 0.6,
          height: this.size * 0.6,
        ),
      ),
    );
  }
}
