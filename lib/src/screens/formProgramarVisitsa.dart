import 'dart:ffi';

import 'package:cga/src/identidad/marca.dart';
import 'package:flutter/material.dart';
import '../printing/componentesFormularios.dart';

class FormProgramarVisita extends StatefulWidget {
  const FormProgramarVisita({Key? key}) : super(key: key);

  @override
  State<FormProgramarVisita> createState() => _FormProgramarVisitaState();
}

class _FormProgramarVisitaState extends State<FormProgramarVisita> {

  List<Widget> StepsList = [
    Steps(datoPrincipal: 'Nombre Clienta', datoSecundario: 'Empresa', stepTitle: 'Clientesssss', count: 3),
    Steps(datoPrincipal: 'Nombre Clienta', datoSecundario: 'Empresa', stepTitle: 'Clase de contacto'),
    Steps(datoPrincipal: 'Nombre Clienta', datoSecundario: 'Empresa', stepTitle: 'Clientesssss'),
    StepDateTime(),
  ];


  xd(List valuesStatus){
    String _statusP1 = valuesStatus[0];
    String _statusP2 = valuesStatus[1];
    String _statusP3 = valuesStatus[2];
    String _statusP4 = valuesStatus[3];
    List<String> Variables = [_statusP1,_statusP2,_statusP3,_statusP4];
   return  Variables;
  }


  int _selectedIndexF1 = 0;
  int _selectedIndexF2 = 0;
  int _selectedIndexF3 = 0;
  //int _selectedIndexF4 = 0;

  @override
  //CONTENEDOR GENERAL
  Widget build(BuildContext context) {
    List<String> valuesStatus = ['','','',''];
    return ContenedorDeFormulario(contentSteps: StepsList, variablesDeEstadoParaIndicadores: xd(valuesStatus));
  }
}
