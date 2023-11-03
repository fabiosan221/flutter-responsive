import 'package:flutter/material.dart';

//Se importa el paquete math de flutter para calcular la diagonal y se le genera
// un alias
import 'dart:math' as math;

class Responsive {
  //Propiedades privadas en la cual se define el ancho, alto y diagonal
  //del dispositivo
  double _width = 0.0, _height = 0.0, _diagonal = 0.0;

  bool _isTablet = false;

  //Al ser privadas las propiedades de las dimensiones, se debe establecer
  //los respectivos get para acceder a dichos valores
  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;
  bool get isTablet => _isTablet;

  //Funcion estatica que retorna una instancia de la clase responsive
  static Responsive of(BuildContext context) => Responsive(context);

  //Se crea el constructor de la clase
  Responsive(BuildContext context) {
    //Se obtiene el tamaño del dispositivo y se extraen cada uno de los parametros
    //de medida
    final Size size = MediaQuery.of(context).size;
    this._width = size.width;
    this._height = size.height;
    //La diagonal se obtiene utilizando el teorema de pitagoras
    //Esto es la raiz cuadrada de la suma del cuadrado del ancho mas el cuadrado del alto
    //a=ancho
    //b=alto
    //c2 + a2 + b2 => c = srt(a2 + b2)
    //Valor de la diagonal
    this._diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

    //Se verifica si el dispositivo en una tablet o un telefono
    //Se calcula el ancho y el alto para indicar el valor mas pequeño de estos 2
    //parametros
    //Si el valor es mayor o igual a los 600 pixeles, entonces la aplicacion se
    //ejecuta en una tablet
    this._isTablet = size.shortestSide >= 600;
  }

  //Funciones que permiten obtener las medidas de pantalla del dispositivo en
  //base a porcentajes. Por ejemplo: 50% del ancho o el 20% de la diagonal

  //Valor del ancho con respecto a un porcentaje
  double wp(double percent) => _width * percent / 100;

  //Valor del alto con respecto a un porcentaje
  double hp(double percent) => _height * percent / 100;

  //Valor de la diagonal con respecto a un porcentaje
  double dp(double percent) => _diagonal * percent / 100;
}
