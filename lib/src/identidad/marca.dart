import 'package:flutter/material.dart';

identidadColor(color){
  int identidadC;
  if(color == 'Primario Azul'){
    return identidadC = 0xFF0080C4;
  }else if(color == 'Azul'){
    return identidadC = 0x330080C4;
  }else if(color == 'Veige'){
    return identidadC = 0xFFF5F5F5;
  }else if(color == 'Rojo'){
    return identidadC = 0xFFFF7777;
  }else if(color == 'Verde'){
    return identidadC = 0xFF25C98E;
  }else if(color == 'Gris'){
    return identidadC = 0xFFF2F2F2;
  }else{
    return identidadC = 0xFFF9F9F9;
  }
}


identidadMedidas(context, medida){
  double pading;
  double margin;
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  if(medida == 'Pading'){
    return pading = 22;
  }else if(medida == 'Margin'){
    return margin = 22;
  }else if(medida == 'Height'){
    return height;
  }else if(medida == 'Width'){
    return width;
  }
}