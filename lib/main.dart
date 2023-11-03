import 'package:flutter/material.dart';
import 'package:flutter_responsive/pages/home_page.dart';
//Se importa la libreria services de flutter que permite utilizar la
//funcion de bloqueo de pantalla
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Mediante este metodo, se puede indicar las orientaciones que se van a utilizar
    //en la aplicacion. Como resultado de esto, se puede indicar que toda la interfaz
    //se vea, por ejemplo, en modo vertical
    //Se define una lista de orientaciones
    SystemChrome.setPreferredOrientations([
      //Con estas propiedades se establece que que el dispositivo no rote,
      //bloqueando la interfaz de la aplicación
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
