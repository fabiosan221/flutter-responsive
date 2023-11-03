import 'package:flutter/material.dart';
import 'package:flutter_responsive/utils/responsive.dart';
import 'input_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      // left: 20,
      // right: 20,
      child: Container(
        //La propiedad constraints permite especificar limites en las medidas de
        //los componentes
        //Si el dispositivo es una tablet, entonces en ancho maximo para el
        //formulario es 430 pixeles, sino 360 pixeles
        constraints: BoxConstraints(maxWidth: responsive.isTablet ? 430 : 360),
        child: Column(
          children: <Widget>[
            //Input de email
            InputText(
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4)),
            SizedBox(
              height: responsive.dp(2),
            ),
            //Input de contraseña
            Container(
              //Borde inferior del input de la contraseña
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black45))),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: InputText(
                    label: 'Contraseña',
                    obscureText: true,
                    borderEnable: false,
                    fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                  )),
                  //Boton para recuperar contraseña
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '¿Olvidó su contraseña?',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:
                                responsive.dp(responsive.isTablet ? 1.2 : 1.4)),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: responsive.dp(5),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Ingresar',
                      style: TextStyle(
                          color: Colors.white, fontSize: responsive.dp(1.5)),
                    ),
                  )),
            ),
            SizedBox(
              height: responsive.dp(2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '¿Deseas registrarte?',
                  style: TextStyle(fontSize: responsive.dp(1.5)),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: responsive.dp(1.5)),
                    ))
              ],
            ),
            SizedBox(
              height: responsive.dp(10),
            ),
          ],
        ),
      ),
    );
  }
}
