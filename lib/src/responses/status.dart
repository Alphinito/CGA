import 'package:flutter/material.dart';

import '../identidad/marca.dart';

respuesta(context, tipe,textTitle, text) {
  int color;
  if(tipe == 'error'){
    color = identidadColor('Rojo');
  }else if (tipe == 'ok'){
    color = identidadColor('Verde');
  }else{
    color = identidadColor('Primario Azul');
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
        color: Color(color),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Text(textTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),
          Text(text, style: const TextStyle(fontSize: 14),)
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,

  ));
}
