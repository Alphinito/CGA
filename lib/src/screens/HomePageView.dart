import 'package:flutter/material.dart';

import '../identidad/marca.dart';
import '../logic/login.dart';

//-----------------------------------------------------------------------------|BUTTON CUSTOM 1
class HomePageView extends StatelessWidget {
  // final String text;
  // final int color;
  // final double width, height;
  // VoidCallback onTap;
  //
  // ButtonCustom1({
  //   super.key,
  //   required this.text,
  //   required this.onTap,
  //   this.color = 0xFF2587C9,
  //   this.width = 50,
  //   this.height = 50,
  // });
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
                  children: const [
                    Text(
                      '1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
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
                      children: const [
                        Text('Visitas programadas'),
                        SizedBox(height: 19),
                        Text(
                          '8',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(height: 19)
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
