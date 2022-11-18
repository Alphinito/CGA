import 'package:cga/src/identidad/marca.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../data/globals.dart' as globals;
import 'package:http/http.dart' as http;
import '../logic/formProgramarVisita.dart';
import '../printing/componentes.dart';
import '../responses/status.dart';

class HomeFormsView extends StatefulWidget {
  @override
  State<HomeFormsView> createState() => _HomeFormsViewState();
}

class _HomeFormsViewState extends State<HomeFormsView> {
  List<dynamic> Visitas = [];
  List<dynamic> VisitasReales = [];
  bool _loading = true;
  bool _loading2 = true;

  GetVisitas3() async {
    try {//---------------------------------------------------------------------|GET VISITAS PLAN
      var res = await http.get(Uri.http("10.0.2.2:9000", "form-visitas/list/${globals.empId}"));
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
      var res = await http.get(Uri.http("10.0.2.2:9000", "visitas-real/list/${globals.empId}"));
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
            ? Container(
              height: 88,
              margin: EdgeInsets.all(150),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: CircularProgressIndicator(
                    color: Color(identidadColor('Primario Azul')),
                  backgroundColor: Color(identidadColor('Rojo')),
                ),
              ),
            )
            : ContPreviewVisitasProgramadas(
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
            ? Container(
          height: 88,
          margin: EdgeInsets.all(150),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CircularProgressIndicator(
              color: Color(identidadColor('Primario Azul')),
              backgroundColor: Color(identidadColor('Rojo')),
            ),
          ),
        )
            : ContPreviewVisitasProgramadas(
            tipoFormulario: 'Visita Real',
            title: 'Visitas reales',
            params: const ['CLI_NOMBRE','MOT_MOTIVO','REA_FECHA','REA_HORA'],
            onTapAdd: () {
              irFormularioVisitaReal(context);
            },
            onTapList: () {
              irViewVisitaReal(context);
            },
            getDataList: VisitasReales
        )
      ],
    );
  }
}
