import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api/apiMethods.dart';
import '../data/globals.dart' as globals;
import '../responses/status.dart';

//-----------------------------------------------------------------------|GO TO|
irFormularioProgramarVisita(context) {
  Navigator.of(context).pushNamed('/formProgramarVisita');
}
irFormularioVisitaReal(context) {
  Navigator.of(context).pushNamed('/formVisitaReal');
}
irViewVisitaReal(context) {
  Navigator.of(context).pushNamed('/ViewListVisitaReal');
}
irViewVisitaPlan(context) {
  Navigator.of(context).pushNamed('/ViewListVisitaPlan');
}
irViewVisitaCompleta(context) {
  Navigator.of(context).pushNamed('/ViewListVisitaCompletada');
}
irFormularioSeguimiento(context, visId) {
  Navigator.of(context).pushNamed('/formSeguimiento',arguments: visId);
}


//-------------------------------------------------------------------|SEND DATA|
final headers = {"Content-Type": "application/json;charset=UTF-8"};
enviarDatosDeFormulario(context,cliente, motivo, fecha, horaInicio, horaFin, observacion) async {
  final body = {
    "VIS_ESPECIALISTA": globals.empId,
    "VIS_CLIENTE": cliente,
    "VIS_MOTIVO_CONTACTO": motivo,
    "VIS_FECHA": "$fecha",
    "VIS_HORA_INICIO": "$horaInicio",
    "VIS_HORA_FIN": "$horaFin",
    "VIS_OBSERVACION": "$observacion"
  };
  try{
    apiPOST(body, "form-visitas");
    Navigator.pushNamedAndRemoveUntil(context,'/home',(_) => false);
    return respuesta(context, 'ok','Guardado', 'Registro almacenado con exito');
  }catch(err){
    return respuesta(context, 'error','Error', '$err');
  }

}

enviarDatosDeFormularioReal(context,cliente, motivo, fecha, hora, observacion) async {
  final body = {
    "VIS_ESPECIALISTA": globals.empId,
    "VIS_CLIENTE": cliente,
    "VIS_MOTIVO_CONTACTO": motivo,
    "VIS_OBSERVACION": "$observacion",
    "VIS_REAL": 1
  };
  var idForm;
  int idVisitaPlan = 0;

  try{

    //--------------------------------------------------------------------------|POST VISITA PLAN
    apiPOST(body,"form-visitas");

    //--------------------------------------------------------------------------|GET ID VISITA PLAN
    var res = await http.get(Uri.http(globals.linkAPI, "form-visitas/${globals.empId}"));
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      idForm = jsonData;
    }

    idVisitaPlan = idForm[0]['VIS_ID'];

    final body2 = {
      "REA_VIS": idVisitaPlan,
      "REA_DIRECTA": 1,
      "REA_FECHA": "$fecha",
      "REA_HORA": "$hora",
    };

    //--------------------------------------------------------------------------|POST VISITA REAL
    apiPOST(body2,"visitas-real");
    //--------------------------------------------------------------------------|RESULTADO CORRECTO
    Navigator.pushNamedAndRemoveUntil(context,'/home',(_) => false);
    return respuesta(context, 'ok','Guardado', 'Registro almacenado con exito');
  }catch(err){//----------------------------------------------------------------|Captura de error
    print(err);
    return respuesta(context, 'error','Error', '$err');
  }

}

enviarDatosDeSeguimiento(context,SEG_VISITA, SEG_RESULTADO, SEG_RESULTADO_OTRO, SEG_RAZON, SEG_RAZON_OTRO, SEG_OBSERVACION) async {
  final bodyPOST = {
    "SEG_VISITA": SEG_VISITA,
    "SEG_RESULTADO": SEG_RESULTADO,
    "SEG_RESULTADO_OTRO": "$SEG_RESULTADO_OTRO",
    "SEG_RAZON": SEG_RAZON,
    "SEG_RAZON_OTRO": "$SEG_RAZON_OTRO",
    "SEG_OBSERVACION": "$SEG_OBSERVACION",
  };
  final bodyPUT = {
    "REA_RESULTADO": 1
  };
  try{
    apiPUT(bodyPUT, 'visitas-real/updateFOCUS/$SEG_VISITA');
    apiPOST(bodyPOST, 'seguimiento');
    Navigator.pushNamedAndRemoveUntil(context,'/home',(_) => false);
    return respuesta(context, 'ok','Guardado', 'Registro almacenado con exito');
  }catch(err){
    return respuesta(context, 'error','Error', '$err');
  }

}
