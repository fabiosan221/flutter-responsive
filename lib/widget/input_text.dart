import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  //Variable para almacenar el nombre de la etiqueta que se pasa por parametro
  final String label;

  //Variable para almacenar el tipo de teclado a mostrar para un tipo de input
  final TextInputType keyboardType;

  //Variable para almacenar el valor booleano de ocultar o mostrar caracteres
  //en un input
  final bool obscureText;

  //Variable para almacenar el valor booleano de ocultar o mostrar el borde
  //en un input
  final bool borderEnable;

  //Variable para almacenar el valor del tamaño de la fuente de un input
  //en un input
  final double fontSize;

  const InputText(
      {super.key,
      this.label = '',
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.borderEnable = true,
      this.fontSize = 15});

  @override
  Widget build(BuildContext context) {
    //Se genera un Input generico para ser reutilizado con los distintos
    //campos de un formulario
    return TextFormField(
      //keyboardType permite determinar el tipo de teclado a mostrar.
      //Por ejemplo, de tipo email, tipo texto, tipo numerico, etc
      keyboardType: this.keyboardType,
      //obscureText permite ocultar los caracteres del input para utilizar en
      //campos de contraseñas
      obscureText: this.obscureText,
      //Se aplica el estilo de texto dentro de los inputs
      style: TextStyle(fontSize: this.fontSize),
      decoration: InputDecoration(
          labelText: this.label,
          //Propiedad para reducir padding entre texto y borde del input
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          //Propiedad para establecer la configuracion de los bordes en
          //los inputs
          enabledBorder: this.borderEnable
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45))
              : InputBorder.none,
          labelStyle: const TextStyle(
              color: Colors.black45, fontWeight: FontWeight.w500)),
    );
  }
}
