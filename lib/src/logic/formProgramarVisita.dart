import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../responses/status.dart';

irFormularioProgramarVisita(context) {
  Navigator.of(context).pushNamed('/formProgramarVisita');
}

// Get() async {
//   var res = await http.get(Uri.http("10.0.2.2:9000", "log/1000810187/clave"));
//   if (res.statusCode == 200) {
//     var jsonData = jsonDecode(res.body);
//     setState(() {
//       _users = jsonData;
//       _loading = false;
//     });
//   }
// }
//
// Set() async {
//   final body = {"user_nombre": _nombre.text, "user_cargo": _cargo.text};
//   await http.post(
//     Uri.http("10.0.2.2:9000", "api"),
//     headers: headers,
//     body: jsonEncode(body),
//   );
// }
//
final headers = {"Content-Type": "application/json;charset=UTF-8"};
enviarDatosDeFormulario(context,cliente, motivo, fecha, horaInicio, horaFin, observacion) async {
  final body = {
    "VIS_ESPECIALISTA": 2,
    "VIS_CLIENTE": 2,
    "VIS_MOTIVO_CONTACTO": 2,
    "VIS_FECHA": "$fecha",
    "VIS_HORA_INICIO": "$horaInicio",
    "VIS_HORA_FIN": "$horaFin",
    "VIS_OBSERVACION": "$observacion"
  };
  try{
    await http.post(
      Uri.http("10.0.2.2:9000", "form-visitas"),
      headers: headers,
      body: jsonEncode(body),
    );
    Navigator.pop(context);
    return respuesta(context, 'ok','Guardado', 'Registro almacenado con exito');
  }catch(err){
    return respuesta(context, 'error','Error', '$err');
  }

}
