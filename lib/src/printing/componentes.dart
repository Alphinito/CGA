import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../identidad/marca.dart';
import 'componentesListViews.dart';

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
class IndPreview extends StatelessWidget {
  final List dataList;
  final List params;
  final int index;
  final String tipoDeFormulario;

  IndPreview({
    super.key,
    required this.dataList,
    required this.params,
    required this.index,
    required this.tipoDeFormulario,
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
        title: Text(dataList[index][params[0]]),
        subtitle: Text(dataList[index][params[1]].toString()),
        selectedColor: Color(identidadColor('Gris')),
        onTap: () {
          tipoDeFormulario == 'Visita Plan'
              ? DetalleVisitasPlan(context, index,dataList)
              : tipoDeFormulario == 'Visita Real'
                  ? DetalleVisitasReal(context, index,dataList)
                  : tipoDeFormulario == 'Visita Con Seguimiento'
                      ? DetalleVisitasCompleta(
                          context, index,dataList, dataList[index]['VIS_ID'])
                      : '';
        },
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateTime.parse(dataList[index][params[2]]).toString().substring(0, 10),
              style: const TextStyle(
                  fontWeight: FontWeight.w100, fontStyle: FontStyle.italic),
            ),
            Text(dataList[index][params[3]],
                style: const TextStyle(
                    fontWeight: FontWeight.w100, fontStyle: FontStyle.italic))
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------------------------------------|PREVIEW VISITAS PROGRAMADAS
class ContPreview extends StatefulWidget {
  final String title;
  VoidCallback onTapAdd;
  VoidCallback onTapList;
  List getDataList;
  List params;
  String tipoFormulario;
  Widget iconBlueButton;
  bool listButton;

  ContPreview({
    super.key,
    required this.title,
    required this.onTapAdd,
    required this.onTapList,
    required this.getDataList,
    required this.params,
    required this.tipoFormulario,
    this.iconBlueButton = const Icon(Icons.add),
    this.listButton = true,
  });

  @override
  State<ContPreview> createState() =>
      _ContPreviewState();
}

class _ContPreviewState extends State<ContPreview> {
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
                  widget.getDataList.length > 2
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IndPreview(
                              index: 0,
                              dataList: widget.getDataList,
                              params: widget.params,
                              tipoDeFormulario: widget.tipoFormulario,
                            ),
                            IndPreview(
                              index: 1,
                              dataList: widget.getDataList,
                              params: widget.params,
                              tipoDeFormulario: widget.tipoFormulario,
                            ),
                            IndPreview(
                              index: 2,
                              dataList: widget.getDataList,
                              params: widget.params,
                              tipoDeFormulario: widget.tipoFormulario,
                            ),
                          ],
                        )
                      : widget.getDataList.length == 2
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IndPreview(
                                  index: 0,
                                  dataList: widget.getDataList,
                                  params: widget.params,
                                  tipoDeFormulario: widget.tipoFormulario,
                                ),
                                IndPreview(
                                  index: 1,
                                  dataList: widget.getDataList,
                                  params: widget.params,
                                  tipoDeFormulario: widget.tipoFormulario,
                                ),
                              ],
                            )
                          : widget.getDataList.length == 1
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IndPreview(
                                      index: 0,
                                      dataList: widget.getDataList,
                                      params: widget.params,
                                      tipoDeFormulario: widget.tipoFormulario,
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset('Asets/animations/agendar.json', height: identidadMedidas(context, 'Width')*0.55),
                                  ],
                                ),
                  ButtonCustom2(
                    onTap: widget.onTapAdd,
                    iconn: widget.iconBlueButton,
                    buttonColor: identidadColor('Primario Azul'),
                    width: identidadMedidas(context, 'Width') * 0.1,
                    height: 218,
                  )
                ],
              ),
              widget.listButton
              ? Padding(
                padding:
                    EdgeInsets.all(identidadMedidas(context, 'Pading') * 0.5),
                child: ButtonCustom2(
                  iconn: const Icon(Icons.dehaze),
                  onTap: widget.onTapList,
                  radius: 50,
                ),
              ) : const SizedBox(height: 50)
            ],
          ),
        ),
      ],
    );
  }
}
