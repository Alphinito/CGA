import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<void> x(BuildContext context, us, cl) async {
  var res = await http.get(Uri.http("10.0.2.2:9000", "log/$us/$cl"));
  if (res.statusCode == 200) {
    if(res.body.length > 15) {
      var jsonData = jsonDecode(res.body);
      print(jsonData);
      Navigator.of(context).pushReplacementNamed('/home');

    }else{
      print('------------------------------------------------------------------------------------------- datos erroneos');
    }
  }else{
    print('------------------------------------------------------------------------------------------- error en la conexión ');
  }
}