import 'package:flutter/material.dart';
import '../identidad/marca.dart';
import '../logic/login.dart';
import '../printing/componentes.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _clave = TextEditingController();
  final _user = TextEditingController();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 560,
            color: Color(identidadColor('Primario Azul')),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              color: Colors.transparent,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Image.asset(
                          'Asets/img/logo.png',
                          width: 90,
                          color: Colors.white,
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 60),
                        color: Color(identidadColor('Veige')),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Text(
                                "Bienvenido",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 30,
                                  fontFamily: 'Kabel',
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40, bottom: 80),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: _user,
                                      decoration: const InputDecoration(
                                        labelText: "Usuario",
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _clave,
                                      validator: (value){
                                        if(value != null){
                                          return "Ingrese su clave";
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        labelText: "Clave",
                                      ),
                                      obscureText: true,
                                    ),
                                  ],
                                ),
                              ),
                              ButtonCustom1(
                                text: "GO",
                                onTap: () {
                                  validacionLogin(context, _user.text, _clave.text);
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Pié de página @",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 32, right: 15),
              child: ButtonCustom1(
                text: "Ingresar como cliente",
                width: 120,
                color: 0xFFFFFFFF,
                onTap: () {
                  const SnackBar(content: Text("ERROR"));
                  //Navigator.of(context).pushReplacementNamed('/clientView');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
