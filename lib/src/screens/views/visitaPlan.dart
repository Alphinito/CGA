import 'package:cga/src/printing/componentesListViews.dart';
import 'package:flutter/material.dart';
import '../../data/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../responses/status.dart';

class VisitaPlanListView extends StatefulWidget {
  const VisitaPlanListView({Key? key}) : super(key: key);

  @override
  State<VisitaPlanListView> createState() => _VisitaPlanListViewState();
}

class _VisitaPlanListViewState extends State<VisitaPlanListView> {

  bool _loading = true;
  List<dynamic> visitasPlan = [];

  Get() async {
    try{
      var res = await http.get(Uri.http("10.0.2.2:9000", "form-visitas/list/${globals.empId}"));
      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        setState(() {
          visitasPlan = jsonData;
          _loading = false;
        });
      }
    }catch(err){
      respuesta(context, 'error', 'Error!', '$err');
    }
  }
  @override
  void initState() {
    super.initState();
    Get();
  }
  @override
  Widget build(BuildContext context) {
    return ContenedorListView(title: 'Visitas programadas', visitasReales: visitasPlan, params: const ['CLI_NOMBRE','MOT_MOTIVO','VIS_FECHA','VIS_HORA_INICIO']);
  }
}