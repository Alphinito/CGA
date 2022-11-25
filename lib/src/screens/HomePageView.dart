import 'package:cga/src/logic/formularios.dart';
import 'package:flutter/material.dart';
import '../api/apiMethods.dart';
import '../identidad/marca.dart';
import '../data/globals.dart' as globals;
import '../printing/charts.dart';

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
  double chartDay1 = 5;
  double chartDay2 = 5;
  double chartDay3 = 5;
  double chartDay4 = 5;
  double chartDay5 = 5;
  double chartDay6 = 5;
  double chartDay7 = 8;

  setIndicators() async{
    //INSIGTS FRIST ROW
    List dataListSeguimientos = await apiGET(context, 'visitas-real/list-sinSeg/${globals.empId}');
    print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| dataListSeguimientos DONE');
    List dataListProgramadas = await apiGET(context, 'form-visitas/list/${globals.empId}');
    print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| dataListProgramadas DONE');
    List cantidadTODAY = await apiGET(context, 'form-visitas/today/${globals.empId}');
    print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| cantidadTODAY DONE');
    List cantidadTOMORROW = await apiGET(context, 'form-visitas/tomorrow/${globals.empId}');
    print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| cantidadTOMORROW DONE');
    //CHARTS Graphic1
    List chartDay1 = await apiGET(context, 'charts/graphic1/1/${globals.empId}');
    print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 1 DONE');
    // List chartDay2 = await apiGET(context, 'charts/graphic1/2/${globals.empId}');
    // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 2 DONE');
    // List chartDay3 = await apiGET(context, 'charts/graphic1/3/${globals.empId}');
    // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 3 DONE');
    // List chartDay4 = await apiGET(context, 'charts/graphic1/4/${globals.empId}');
    // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 4 DONE');
    // List chartDay5 = await apiGET(context, 'charts/graphic1/5/${globals.empId}');
    // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 5 DONE');
    // List chartDay6 = await apiGET(context, 'charts/graphic1/6/${globals.empId}');
    // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 6 DONE');
    // List chartDay7 = await apiGET(context, 'charts/graphic1/7/${globals.empId}');
    // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 7 DONE');
    setState(() {
      seguimientosFaltantes = dataListSeguimientos.length.toString();
      visitasProgramadas = dataListProgramadas.length.toString();
      today = cantidadTODAY[0]['COUNT(VIS_ID)'].toString();
      tomorrow = cantidadTOMORROW[0]['COUNT(VIS_ID)'].toString();
      chartDay1 = chartDay1[0]['COUNT(VIS_ID)'];
      print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 1 SAVED');
      // chartDay2 = chartDay2[0]['COUNT(VIS_ID)'];
      // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 2 SAVED');
      // chartDay3 = chartDay3[0]['COUNT(VIS_ID)'];
      // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 3 SAVED');
      // chartDay4 = chartDay4[0]['COUNT(VIS_ID)'];
      // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 4 SAVED');
      // chartDay5 = chartDay5[0]['COUNT(VIS_ID)'];
      // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 5 SAVED');
      // chartDay6 = chartDay6[0]['COUNT(VIS_ID)'];
      // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 6 SAVED');
      // chartDay7 = chartDay7[0]['COUNT(VIS_ID)'];
      // print('----|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| DAY 7 SAVED');
    });
  }
  @override
  void initState() {
    super.initState();
    setIndicators();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(identidadMedidas(context,'Pading')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  irViewVisitaReal(context);
                },
                child: Container(//-----------------------------------------------------|INDICADOR SEGUIMIENTOS FALTANTES
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(identidadColor('Primario Azul'))),
                      borderRadius: const BorderRadius.all(Radius.circular(150))),
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
                onTap: (){irViewVisitaPlan(context);},
                child: Container(//-----------------------------------------------------|INDICADOR VISITAS PENDIENTES
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
                      border: Border.all(
                          color: Color(identidadColor('Gris'))),
                      borderRadius: const BorderRadius.all(Radius.circular(20))),
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
                            children: const[
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
          child: Graphic1(day1: chartDay1, day2: chartDay2,day3: chartDay3,day4: chartDay4,day5: chartDay5,day6: chartDay6,day7: chartDay7,),
        )
      ],
    );
  }
}
