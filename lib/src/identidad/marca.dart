import 'package:flutter/material.dart';

identidadColor(color){
  int identidadC;
  if(color == 'Primario Azul'){
    return identidadC = 0xFF0080C4;
  }else if(color == 'Veige'){
    return identidadC = 0xFFF5F5F5;
  }else if(color == 'Rojo'){
    return identidadC = 0xFFFF7777;
  }else if(color == 'Verde'){
    return identidadC = 0xFF25C98E;
  }else{
    return identidadC = 0xFFF9F9F9;
  }
}