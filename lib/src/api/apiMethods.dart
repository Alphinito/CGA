import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/globals.dart' as globals;
import '../responses/status.dart';

apiPOST(body, dir) async{
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  await http.post(
    Uri.http(globals.linkAPI, "$dir"),
    headers: headers,
    body: jsonEncode(body),
  );
}

apiPUT(body, dir) async{
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  await http.put(
    Uri.http(globals.linkAPI, "$dir"),
    headers: headers,
    body: jsonEncode(body),
  );
}

apiGET(context,dir) async{
  try {//---------------------------------------------------------------------|GET VISITAS PLAN
    var res = await http.get(Uri.http(globals.linkAPI, "$dir"));
    List<dynamic> VisitasReales = [];
    if (res.statusCode == 200) {
      var jsonData1 = jsonDecode(res.body);
      return  VisitasReales = jsonData1;
    }
  } catch (err) {
    respuesta(context, 'error', 'Error!', '$err');
  }
}

apiGETone(context,dir,String date) async{
  try {//---------------------------------------------------------------------|GET VISITAS PLAN
    var res = await http.get(Uri.http(globals.linkAPI, "$dir"));
    if (res.statusCode == 200) {
      var jsonData1 = jsonDecode(res.body);
      return jsonData1[0][date];
    }
  } catch (err) {
    respuesta(context, 'error', 'Error!', '$err');
  }
}