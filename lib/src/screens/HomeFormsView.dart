import 'package:flutter/material.dart';

import '../logic/formProgramarVisita.dart';
import '../printing/componentes.dart';

class HomeFormsView extends StatelessWidget {
  // final String text;
  // final int color;
  // final double width, height;
  // VoidCallback onTap;
  //
  // ButtonCustom1({
  //   super.key,
  //   required this.text,
  //   required this.onTap,
  //   this.color = 0xFF2587C9,
  //   this.width = 50,
  //   this.height = 50,
  // });
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ContPreviewVisitasProgramadas(title: 'Visitas programadas',onTap: (){irFormularioProgramarVisita(context);}),
        ContPreviewVisitasProgramadas(title: 'Seguimiento a visitas',onTap: (){}),
        ContPreviewVisitasProgramadas(title: 'Visitas Registradas',onTap: (){}),
        ContPreviewVisitasProgramadas(title: 'Visitas programadas',onTap: (){}),
        ContPreviewVisitasProgramadas(title: 'Seguimiento a visitas',onTap: (){}),
        ContPreviewVisitasProgramadas(title: 'Visitas Registradas',onTap: (){}),
      ],
    );
  }
}