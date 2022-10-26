import 'package:flutter/material.dart';
import '../logic/login.dart';
import '../printing/componentes.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 560,
            color: const Color(0xFF0080C4),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Image.asset('Asets/img/logo.png', width: 90, color: Colors.white,),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      color: const Color(0xFFF5F5F5),
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
                                    decoration: const InputDecoration(
                                      labelText: "Usuario",
                                    ),
                                  ),
                                  TextFormField(
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
                              onTap: (){Navigator.of(context).pushReplacementNamed('/home');},
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
              padding: const EdgeInsets.only(top: 20),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Ingresar como cliente >",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
