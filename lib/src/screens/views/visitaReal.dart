import 'package:cga/src/printing/componentesListViews.dart';
import 'package:flutter/material.dart';
import '../../data/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../responses/status.dart';

class VisitaRealListView extends StatefulWidget {
  const VisitaRealListView({Key? key}) : super(key: key);

  @override
  State<VisitaRealListView> createState() => _VisitaRealListViewState();
}

class _VisitaRealListViewState extends State<VisitaRealListView> {

  bool _loading = true;
  List<dynamic> visitasReales = [];

  Get() async {
    try{
      var res = await http.get(Uri.http(globals.linkAPI, "visitas-real/list/${globals.empId}"));
      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        setState(() {
          visitasReales = jsonData;
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
    return ContenedorListView(title: 'Visitas reales', visitasReales: visitasReales, params: const ['CLI_NOMBRE','MOT_MOTIVO','REA_FECHA','REA_HORA']);
  }
}
