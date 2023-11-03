import 'package:flutter/material.dart';
import 'package:flutter_responsive/utils/responsive.dart';
import 'package:flutter_responsive/widget/circle.dart';
import 'package:flutter_responsive/widget/icon_container.dart';
import 'package:flutter_responsive/widget/login_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Se utiliza las reglas de MediaQuery para obtener las dimensiones del
    //dispositivo
    //final Size size = MediaQuery.of(context).size;

    //Se envia el contexto a la clase responsive. De esta manera, no se necesita
    //calcular el tamaño para cada widget
    final Responsive responsive = Responsive.of(context);

    //Se establece el tamaño de las esferas de la intefaz para poder reutilizar
    //en el varias partes del codigo
    //final double pinkSize = size.width * 0.8;
    //final double orangeSize = size.width * 0.57;

    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);

    return Scaffold(
      //Se envuelve los widget en un GestureDetector para que al hacer clic
      //en un sector de la pantalla, se pierda el foco de la acción
      body: GestureDetector(
        onTap: () {
          //Accion que permite minimizar el teclado cuando se pierde el foco de
          //atención de un input
          FocusScope.of(context).unfocus();
        },
        //Se define el widget SingleChildScrollView para evitar el desplazamiento
        //del formulario cuando se abre el teclado del dispositivo, para no
        //solapar componentes en la interfáz gráfica
        child: SingleChildScrollView(
          child: Container(
            //Ancho del dispositivo
            width: double.infinity,
            //Altura del dispositivo
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                //Widget para establecer la posicion del circulo
                Positioned(
                    //Parametros de posicion del objeto
                    top: -pinkSize * 0.5,
                    right: -pinkSize * 0.2,
                    child: Circle(
                      //Se utiliza el valor calculado de la pantalla en vez de un
                      //valor fijo. Para este caso, se calcula el tamaño de pantalla
                      //por 0.8, es decir, el 80% del tamaño de pantalla
                      //size: 320,
                      size: pinkSize,
                      colors: const [Colors.pinkAccent, Colors.pink],
                    )),
                Positioned(
                    //Parametros de posicion del objeto
                    top: -orangeSize * 0.55,
                    left: -orangeSize * 0.15,
                    child: Circle(
                      //size: 240,
                      size: orangeSize,
                      colors: const [Colors.orange, Colors.deepOrangeAccent],
                    )),
                //Se define el contenedor para el icono
                Positioned(
                    //Margen superior
                    top: pinkSize * 0.35,
                    child: Column(
                      children: <Widget>[
                        IconContainer(
                            //Enviamos tamaño del avatar teniendo en cuenta el
                            //dispositivo donde se va a visualizar
                            //size: size.width * 0.17),
                            size: responsive.wp(17)),
                        SizedBox(
                          //height: 30,
                          //Separacion entre el avatar y el texto responsivo
                          height: responsive.dp(3),
                        ),
                        //Texto de bienvenida responsivo
                        Text(
                          'Hola \n ¡Bienvenido de nuevo!',
                          textAlign: TextAlign.center,
                          //Tamaño del texto responsivo basado en la diagonal
                          style: TextStyle(fontSize: responsive.dp(2)),
                        )
                      ],
                    )),
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
