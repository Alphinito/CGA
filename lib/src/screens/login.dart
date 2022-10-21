import 'package:flutter/material.dart';

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
            color: const Color(0xFF2587C9),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 40),
                      child: Icon(Icons.adb, size: 80, color: Colors.white),
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
                            const Text(
                              "Bienvenido",
                              style: TextStyle(fontSize: 30),
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
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFF2587C9)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50))),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Go",
                                  textAlign: TextAlign.center,
                                ),
                              ),
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
            child: Text("Pié de página @", style: TextStyle(color: Colors.grey[300]),),
          ),
        ],
      ),
    );
  }
}
