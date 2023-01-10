import 'package:cga/src/logic/formularios.dart';
import 'package:flutter/material.dart';
import '../api/apiMethods.dart';
import '../identidad/marca.dart';
import '../data/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';
import '../printing/componentes.dart';
import '../printing/charts.dart';
import '../responses/status.dart';

//-----------------------------------------------------------------------------|BUTTON CUSTOM 1
class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  String seguimientosFaltantes = '';
  String visitasProgramadas = '';
  String today = '';
  String tomorrow = '';
  //Charts
  double dChartDay1 = 0;
  double dChartDay2 = 0;
  double dChartDay3 = 0;
  double dChartDay4 = 0;
  double dChartDay5 = 0;
  double dChartDay6 = 0;
  double dChartDay7 = 0;

  bool _loading3 = true;
  List<dynamic> VisitasRealesConSeguimiento = [];

  setIndicators() async {
    //INSIGTS FRIST ROW
    List dataListSeguimientos =
        await apiGET(context, 'visitas-real/list-sinSeg/${globals.empId}');
    List dataListProgramadas =
        await apiGET(context, 'form-visitas/list/${globals.empId}');
    List cantidadTODAY =
        await apiGET(context, 'form-visitas/today/${globals.empId}');
    List cantidadTOMORROW =
        await apiGET(context, 'form-visitas/tomorrow/${globals.empId}');
    //CHARTS Graphic1
    List chartDay1 =
        await apiGET(context, 'charts/graphic1/1/${globals.empId}');
    List chartDay2 =
        await apiGET(context, 'charts/graphic1/2/${globals.empId}');
    List chartDay3 =
        await apiGET(context, 'charts/graphic1/3/${globals.empId}');
    List chartDay4 =
        await apiGET(context, 'charts/graphic1/4/${globals.empId}');
    List chartDay5 =
        await apiGET(context, 'charts/graphic1/5/${globals.empId}');
    List chartDay6 =
        await apiGET(context, 'charts/graphic1/6/${globals.empId}');
    List chartDay7 =
        await apiGET(context, 'charts/graphic1/7/${globals.empId}');
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
    setState(() {
      seguimientosFaltantes = dataListSeguimientos.length.toString();
      visitasProgramadas = dataListProgramadas.length.toString();
      today = cantidadTODAY[0]['COUNT(VIS_ID)'].toString();
      tomorrow = cantidadTOMORROW[0]['COUNT(VIS_ID)'].toString();
      dChartDay1 = chartDay1[0]['COUNT(VIS_ID)'].toDouble();
      dChartDay2 = chartDay2[0]['COUNT(VIS_ID)'].toDouble();
      dChartDay3 = chartDay3[0]['COUNT(VIS_ID)'].toDouble();
      dChartDay4 = chartDay4[0]['COUNT(VIS_ID)'].toDouble();
      dChartDay5 = chartDay5[0]['COUNT(VIS_ID)'].toDouble();
      dChartDay6 = chartDay6[0]['COUNT(VIS_ID)'].toDouble();
      dChartDay7 = chartDay7[0]['COUNT(VIS_ID)'].toDouble();
    });
  }

  @override
  void initState() {
    super.initState();
    setIndicators();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(identidadMedidas(context, 'Pading')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  irViewVisitaReal(context);
                },
                child: Container(
                  //-----------------------------------------------------|INDICADOR SEGUIMIENTOS FALTANTES
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(identidadColor('Primario Azul'))),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(150))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        seguimientosFaltantes,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      const Text(
                        'Seguimientos faltantes',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  irViewVisitaPlan(context);
                },
                child: Container(
                  //-----------------------------------------------------|INDICADOR VISITAS PENDIENTES
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset: const Offset(0, 0),
                        )
                      ],
                      color: Color(identidadColor('Gris')),
                      border: Border.all(color: Color(identidadColor('Gris'))),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Visitas programadas'),
                          const SizedBox(height: 16),
                          Text(
                            visitasProgramadas,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 9)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Para hoy:'),
                              Text('Para mañana:'),
                            ],
                          ),
                          const SizedBox(width: 35),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(today),
                              Text(tomorrow),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 250,
          color: Color(identidadColor('Gris')),
          child: Padding(
            padding: EdgeInsets.all(identidadMedidas(context, 'Pading')),
            child: Graphic1(
              day1: dChartDay1,
              day2: dChartDay2,
              day3: dChartDay3,
              day4: dChartDay4,
              day5: dChartDay5,
              day6: dChartDay6,
              day7: dChartDay7,
            ),
          ),
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
