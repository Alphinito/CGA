import 'package:cga/src/printing/componentesListViews.dart';
import 'package:flutter/material.dart';
import '../../data/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../responses/status.dart';

class VisitaCompletaListView extends StatefulWidget {
  const VisitaCompletaListView({Key? key}) : super(key: key);

  @override
  State<VisitaCompletaListView> createState() => _VisitaCompletaListViewState();
}

class _VisitaCompletaListViewState extends State<VisitaCompletaListView> {

  bool _loading = true;
  List<dynamic> visitasCompletadas = [];

  Get() async {
    try{
      var res = await http.get(Uri.http(globals.linkAPI, "visitas-real/list-conSeg/${globals.empId}"));
      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        setState(() {
          visitasCompletadas = jsonData;
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
    return ContenedorListView(title: 'Visitas Completadas', visitasReales: visitasCompletadas, params: const ['CLI_NOMBRE','VIS_ID','REA_FECHA','REA_HORA']);
  }
}