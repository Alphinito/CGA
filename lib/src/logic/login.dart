import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../responses/status.dart';


validacionLogin(context, us, cl) async {
  try {
    var res = await http.get(Uri.http("10.0.2.2:9000", "log/$us/$cl"));
    if (res.statusCode == 200) {
      if (res.body.length > 15) {
        var jsonData = jsonDecode(res.body);
        print(jsonData);
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        respuesta(context, 'error', "Los datos son incorrectos", "Verifica tus datos y vuelve a intentarlo");
      }
    } else {
      respuesta(
          context, 'error', "Hubo un problema", "Verifica tu conexión a internet");
    }
  }catch (e){
    respuesta(context, 'error', "No hubo respuesta", "Hay problemas con el servidor");
  }
}