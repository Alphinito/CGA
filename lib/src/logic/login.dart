import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../responses/status.dart';
import '../data/globals.dart' as globals;


validacionLogin(context, us, cl) async {
  try {
    var res = await http.get(Uri.http("10.0.2.2:9000", "log/$us/$cl"));
    if (res.statusCode == 200) {
      if (res.body.length > 15) {
        var jsonData = jsonDecode(res.body);
        List<dynamic> _user = jsonData;
        print(_user);
        globals.empId = _user[0]['EMP_ID'];
        globals.empCargo = _user[0]['EMP_CARGO'];
        globals.empCedula = _user[0]['EMP_CEDULA'];
        globals.empNombre= _user[0]['EMP_NOMBRE'];
        globals.empApellido = _user[0]['EMP_APELLIDO'];
        globals.empCorreo = _user[0]['EMP_CORREO'];
        globals.empClave = _user[0]['EMP_CLAVE'];
        globals.empCelular = _user[0]['EMP_CELULAR'];
        globals.empActivo= _user[0]['EMP_ACTIVO'];
        globals.empCentroDeCoste = _user[0]['EMP_CENTRO_DE_COSTE'];
        globals.empSAP = _user[0]['EMP_COD_SAP'];
        //globals.empEquipo = _user[0]['EMP_EQUIPO'];
        //globals.empLider = _user[0]['EMP_LIDER'];
        globals.empZona = _user[0]['EMP_ZONA'];
        globals.empCiudad = _user[0]['EMP_CIUDAD'];
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        respuesta(context, 'error', "Los datos son incorrectos", "Verifica tus datos y vuelve a intentarlo");
      }
    } else {
      respuesta(context, 'error', "Hubo un problema", "Verifica tu conexión a internet");}
  }catch (e){
    print(e);
    // respuesta(context, 'error', "No hubo respuesta", "$e");
  }
}