import 'package:flutter/material.dart';
import '../identidad/marca.dart';

//-----------------------------------------------------------------------------|BUTTON CUSTOM 1
class ButtonCustom1 extends StatelessWidget {
  final String text;
  final int color;
  final double width, height;
  VoidCallback onTap;

  ButtonCustom1({
    super.key,
    required this.text,
    required this.onTap,
    this.color = 0xFF2587C9,
    this.width = 50,
    this.height = 50,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            border: Border.all(color: Color(color)),
            borderRadius: const BorderRadius.all(Radius.circular(50))),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Color(color),
          ),
          onPressed: onTap,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ));
  }
}

//-----------------------------------------------------------------------------|BUTTON CUSTOM 2
class ButtonCustom2 extends StatelessWidget {
  final Widget iconn;
  final int buttonColor;
  final int iconColor;
  final double width, height, radius;
  VoidCallback onTap;

  ButtonCustom2({
    super.key,
    required this.iconn,
    required this.onTap,
    this.buttonColor = 0xFF2587C9,
    this.iconColor = 0xFFFFFFFF,
    this.width = 50,
    this.height = 50,
    this.radius = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Color(buttonColor),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: IconButton(
          onPressed: onTap,
          icon: iconn,
          color: Color(iconColor),
        ));
  }
}

//-----------------------------------------------------------------------------|VISTAS PREVIAS VISITAS
class IndPreviewVisitas extends StatelessWidget {
  final String nombreCliente;
  final String nombreEmpresa;
  final String Fecha;
  final String Hora;

  IndPreviewVisitas({
    super.key,
    required this.nombreCliente,
    required this.nombreEmpresa,
    required this.Fecha,
    required this.Hora,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(identidadColor('Primari Azul')),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: Offset(2, 0),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nombreCliente,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(nombreEmpresa)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Text(Fecha), Text(Hora)],
          )
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------------------|PREVIEW VISITAS PROGRAMADAS
class ContPreviewVisitasProgramadas extends StatelessWidget {
  final String title;
  VoidCallback onTap;

  ContPreviewVisitasProgramadas({
    super.key,
    required this.title,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(identidadMedidas('Pading')),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                color: Color(identidadColor('Primario Azul')),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20), topRight: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IndPreviewVisitas(
                        nombreCliente: 'Miguel Angel Herrera',
                        nombreEmpresa: 'IBM Latam',
                        Fecha: 'Martes 12',
                        Hora: '12:30'),
                    IndPreviewVisitas(
                        nombreCliente: 'Angelica Mora',
                        nombreEmpresa: 'IBM Latam',
                        Fecha: 'Martes 12',
                        Hora: '12:30'),
                    IndPreviewVisitas(
                        nombreCliente: 'Samantha Montenegro',
                        nombreEmpresa: 'IBM Latam',
                        Fecha: 'Martes 12',
                        Hora: '12:30'),
                  ],
                ),
                ButtonCustom2(
                  onTap: onTap,
                  iconn: const Icon(Icons.add),
                  buttonColor: identidadColor('Primario Azul'),
                  width: 65,
                  height: 65,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
