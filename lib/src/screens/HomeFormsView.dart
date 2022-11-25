import 'package:cga/src/identidad/marca.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import '../data/globals.dart' as globals;
import 'package:http/http.dart' as http;
import '../logic/formularios.dart';
import '../printing/componentes.dart';
import '../responses/status.dart';

class HomeFormsView extends StatefulWidget {
  @override
  State<HomeFormsView> createState() => _HomeFormsViewState();
}

class _HomeFormsViewState extends State<HomeFormsView> {
  List<dynamic> Visitas = [];
  List<dynamic> VisitasReales = [];
  List<dynamic> VisitasRealesConSeguimiento = [];
  bool _loading = true;
  bool _loading2 = true;
  bool _loading3 = true;

  GetVisitas3() async {
    try {//---------------------------------------------------------------------|GET VISITAS PLAN
      var res = await http.get(Uri.http(globals.linkAPI, "form-visitas/list/${globals.empId}"));
      if (res.statusCode == 200) {
        var jsonData1 = jsonDecode(res.body);
        setState(() {
          Visitas = jsonData1;
          _loading = false;
        });
      }
    } catch (err) {
      respuesta(context, 'error', 'Error!', '$err');
    }
    try {//---------------------------------------------------------------------|GET VISITAS REALES
      var res = await http.get(Uri.http(globals.linkAPI, "visitas-real/list-sinSeg/${globals.empId}"));
      if (res.statusCode == 200) {
        var jsonData2 = jsonDecode(res.body);
        setState(() {
          VisitasReales = jsonData2;
          _loading2 = false;
        });
      }
    } catch (err) {
      respuesta(context, 'error', 'Error!', '$err');
    }
    try {//---------------------------------------------------------------------|GET VISITAS REALES CON SEGUIMIENTO
      var res = await http.get(Uri.http(globals.linkAPI, "visitas-real/list-conSeg/${globals.empId}"));
      if (res.statusCode == 200) {
        var jsonData3 = jsonDecode(res.body);
        setState(() {
          VisitasRealesConSeguimiento = jsonData3;
          _loading3 = false;
        });
      }
    } catch (err) {
      respuesta(context, 'error', 'Error!', '$err');
    }
  }

  @override
  void initState() {
    super.initState();
    GetVisitas3();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _loading
            ? Lottie.asset('Asets/animations/loadingLine.json',
                height: 350)
            : ContPreview(
          tipoFormulario: 'Visita Plan',
                title: 'Visitas programadas',
                params: const ['CLI_NOMBRE','MOT_MOTIVO','VIS_FECHA','VIS_HORA_INICIO'],
                onTapAdd: () {
                  irFormularioProgramarVisita(context);
                },
            onTapList: (){
              irViewVisitaPlan(context);
            },
                getDataList: Visitas
        ),
        _loading2
            ? Lottie.asset('Asets/animations/loadingLine.json',
            height: 350)
            : ContPreview(
            tipoFormulario: 'Visita Real',
            title: 'Visitas realizadas',
            params: const ['CLI_NOMBRE','MOT_MOTIVO','REA_FECHA','REA_HORA'],
            onTapAdd: () {
              irFormularioVisitaReal(context);
            },
            onTapList: () {
              irViewVisitaReal(context);
            },
            getDataList: VisitasReales
        ),
        _loading3
            ? Lottie.asset('Asets/animations/loadingLine.json',
            height: 350)
            : ContPreview(
            iconBlueButton: const Icon(Icons.dehaze),
            listButton: false,
            tipoFormulario: 'Visita Con Seguimiento',
            title: 'Visitas completadas',
            params: const ['CLI_NOMBRE','VIS_ID','REA_FECHA','REA_HORA'],
            onTapAdd: () {
              irViewVisitaCompleta(context);
            },
            onTapList: () {

            },
            getDataList: VisitasRealesConSeguimiento
        )
      ],
    );
  }
}
