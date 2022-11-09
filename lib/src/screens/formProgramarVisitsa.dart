import 'package:flutter/material.dart';

class FormProgramarVisita extends StatefulWidget {
  const FormProgramarVisita({Key? key}) : super(key: key);

  @override
  State<FormProgramarVisita> createState() => _FormProgramarVisitaState();
}

class _FormProgramarVisitaState extends State<FormProgramarVisita> {
  @override
  //CONTENEDOR GENERAL HOME
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), 
      body: Column(
        children: [
          Center(
            child: Text('FORMULARIO PARA PROGRAMAR VISITAS'),
          )
        ],
      ),
    );
  }
}
