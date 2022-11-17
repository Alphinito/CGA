import 'package:http/http.dart' as http;
import 'dart:convert';

apiGet(body, dir) async{
  final headers = {"Content-Type": "application/json;charset=UTF-8"};
  await http.post(
    Uri.http("10.0.2.2:9000", "$dir"),
    headers: headers,
    body: jsonEncode(body),
  );
}