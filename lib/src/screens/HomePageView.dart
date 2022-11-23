import 'package:flutter/material.dart';
import '../api/apiMethods.dart';
import '../identidad/marca.dart';
import '../data/globals.dart' as globals;

//-----------------------------------------------------------------------------|BUTTON CUSTOM 1
class HomePageView extends StatefulWidget {

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {


  String seguimientosFaltantes = '';
  String visitasProgramadas = '';

  setIndicators() async{
    List dataListSeguimientos = await apiGET(context, 'visitas-real/list-sinSeg/${globals.empId}');
    List dataListProgramadas = await apiGET(context, 'form-visitas/list/${globals.empId}');
    setState(() {
      seguimientosFaltantes = dataListSeguimientos.length.toString();
      visitasProgramadas = dataListProgramadas.length.toString();
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
              Container(
                //-----------------------------------------------------|INDICADOR SEGUIMIENTOS FALTANTES
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
              Container(
                padding: const EdgeInsets.all(20),
                height: 180,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset: Offset(0, 0),
                      )
                    ],
                    color: Color(identidadColor('Gris')),
                    border: Border.all(
                        color: Color(identidadColor('Gris'))),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                //-----------------------------------------------------|INDICADOR VISITAS PENDIENTES
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Visitas programadas'),
                        const SizedBox(height: 19),
                        Text(
                          visitasProgramadas,
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 19)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const[
                            Text('Hoy:'),
                            Text('Mañana:'),
                            Text('Esta semana:'),
                          ],
                        ),
                        const SizedBox(width: 35),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const[
                            Text('3'),
                            Text('2'),
                            Text('6'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 300,
          color: Color(identidadColor('Gris')),
        )
      ],
    );
  }
}
