import 'package:flutter/material.dart';
import '../identidad/marca.dart';

//-----------------------------------------------------------------------------|BUTTON CUSTOM 1 (TEXT)
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

//-----------------------------------------------------------------------------|BUTTON CUSTOM 2 (ICON)
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
      width: identidadMedidas(context, 'Width') * 0.9,
      decoration: BoxDecoration(
        color: Color(identidadColor('Primari Azul')),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(2, 0),
          )
        ],
      ),
      child: ListTile(
        title: Text(nombreCliente),
        subtitle: Text(nombreEmpresa),
        onTap: () {
          print(key);
        },
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Fecha,
              style: const TextStyle(
                  fontWeight: FontWeight.w100, fontStyle: FontStyle.italic),
            ),
            Text(Hora,
                style: const TextStyle(
                    fontWeight: FontWeight.w100, fontStyle: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------------|PREVIEW VISITAS PROGRAMADAS
class ContPreviewVisitasProgramadas extends StatefulWidget {
  final String title;
  VoidCallback onTapAdd;
  VoidCallback onTapList;
  List getDataList;
  List params;

  ContPreviewVisitasProgramadas({
    super.key,
    required this.title,
    required this.onTapAdd,
    required this.onTapList,
    required this.getDataList,
    required this.params,
  });

  @override
  State<ContPreviewVisitasProgramadas> createState() =>
      _ContPreviewVisitasProgramadasState();
}

class _ContPreviewVisitasProgramadasState
    extends State<ContPreviewVisitasProgramadas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: identidadMedidas(context, 'Pading') * 2,
              left: 10,
              bottom: 10),
          child: Text(
            widget.title,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Color(identidadColor('Blanco')),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IndPreviewVisitas(
                          nombreCliente: widget.getDataList[0][widget.params[0]],
                          nombreEmpresa: widget.getDataList[0][widget.params[1]],
                          Fecha: widget.getDataList[0][widget.params[2]],
                          Hora: widget.getDataList[0][widget.params[3]]
                      ),
                      IndPreviewVisitas(
                          nombreCliente: widget.getDataList[1][widget.params[0]],
                          nombreEmpresa: widget.getDataList[1][widget.params[1]],
                          Fecha: widget.getDataList[1][widget.params[2]],
                          Hora: widget.getDataList[1][widget.params[3]]
                      ),
                      IndPreviewVisitas(
                          nombreCliente: widget.getDataList[2][widget.params[0]],
                          nombreEmpresa: widget.getDataList[2][widget.params[1]],
                          Fecha: widget.getDataList[2][widget.params[2]],
                          Hora: widget.getDataList[2][widget.params[3]]
                      ),
                    ],
                  ),
                  ButtonCustom2(
                    onTap: widget.onTapAdd,
                    iconn: const Icon(Icons.add),
                    buttonColor: identidadColor('Primario Azul'),
                    width: identidadMedidas(context, 'Width') * 0.1,
                    height: 218,
                  )
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.all(identidadMedidas(context, 'Pading') * 0.5),
                child: ButtonCustom2(
                  iconn: const Icon(Icons.dehaze),
                  onTap: widget.onTapList,
                  radius: 50,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
