import 'package:cga/src/printing/componentes.dart';
import 'package:flutter/material.dart';
import '../api/apiMethods.dart';
import '../identidad/marca.dart';
import '../logic/formularios.dart';
import '../responses/status.dart';

class CustomSizedBox1 extends StatelessWidget {
  final String title;
  final String value;

  CustomSizedBox1({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Container(
        decoration:
            BoxDecoration(color: Color(identidadColor('blanco')), boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.2,
            blurRadius: 0.2,
            offset: const Offset(0, 0),
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color(identidadColor('Primario Azul'))),
            ),
            Text(value)
          ],
        ),
      ),
    );
  }
}

class CustomSizedBox2 extends StatelessWidget {
  final String title;
  final String value;

  CustomSizedBox2({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: identidadMedidas(context, 'Pading') * 0.4),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color(identidadColor('Primario Azul'))),
            ),
            const SizedBox(height: 5),
            Text(value)
          ],
        ),
      ),
    );
  }
}

planToReal(context, id) async {
  //--------------------------------------------------------------|DATA TO SEND|
  final body = {"VIS_REAL": 1};
  final body2 = {
    "REA_VIS": id,
    "REA_DIRECTA": 0,
    "REA_FECHA": "${DateTime.now()}",
    "REA_HORA": "${TimeOfDay.now().format(context)}",
  };

  try {
    //----------------------------------------------------------|SERVER REQUEST|
    apiPUT(body, 'form-visitas/updateMAIN/$id');
    apiPOST(body2, "visitas-real");
    //---------------------------------------------------------------|RESULTADO|
    Navigator.pushNamedAndRemoveUntil(context,'/home',(_) => false);
    respuesta(
        context, 'ok', 'Echo!', 'El registro $id ha pasado a visita Real');
  } catch (err) {
    respuesta(context, 'error', 'Error!', '$err');
  }
}

realToSeguimiento(context, id) async {
  //--------------------------------------------------------------|DATA TO SEND|
  final body = {"VIS_REAL": 1};
  final body2 = {
    "REA_VIS": id,
    "REA_DIRECTA": 0,
    "REA_FECHA": "${DateTime.now()}",
    "REA_HORA": "${TimeOfDay.now().format(context)}",
  };

  try {
    //----------------------------------------------------------|SERVER REQUEST|
    apiPUT(body, 'form-visitas/updateMAIN/$id');
    apiPOST(body2, "visitas-real");
    //---------------------------------------------------------------|RESULTADO|
    Navigator.pushNamedAndRemoveUntil(context,'/home',(_) => false);
    respuesta(
        context, 'ok', 'Echo!', 'El registro $id ha pasado a visita Real');
  } catch (err) {
    respuesta(context, 'error', 'Error!', '$err');
  }
}

DetalleVisitasPlan(context, index, data) {
  return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: const Text('Detalle de visita programada'),
            contentPadding: EdgeInsets.all(identidadMedidas(context, 'Pading')),
            children: [
              CustomSizedBox1(
                  title: 'ID:', value: data[index]['VIS_ID'].toString()),
              CustomSizedBox1(
                  title: 'Especialista:',
                  value: data[index]['VIS_ESPECIALISTA'].toString()),
              CustomSizedBox2(
                  title: 'Cliente:',
                  value: data[index]['CLI_NOMBRE'] +
                      ' (SAP:' +
                      data[index]['CLI_SAP'].toString() +
                      ')'),
              CustomSizedBox1(
                  title: 'Motivo de contacto:',
                  value:
                      '${data[index]['MOT_MOTIVO']} (${data[index]['VIS_MOTIVO_CONTACTO'].toString()})'),
              CustomSizedBox1(title: 'Fecha:', value: data[index]['VIS_FECHA']),
              CustomSizedBox1(
                  title: 'Hora inicio:', value: data[index]['VIS_HORA_INICIO']),
              CustomSizedBox1(
                  title: 'Hora fin:', value: data[index]['VIS_HORA_FIN']),
              CustomSizedBox2(
                  title: 'Observación:', value: data[index]['VIS_OBSERVACION']),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      ButtonCustom2(
                          radius: 50,
                          height: 40,
                          width: 40,
                          iconn: const Icon(Icons.import_export),
                          onTap: () {
                            planToReal(context, data[index]['VIS_ID']);
                          }),
                      const Text('Convertir a real')
                    ],
                  ),
                  Column(
                    children: [
                      ButtonCustom2(
                          buttonColor: identidadColor('Rojo'),
                          radius: 50,
                          height: 40,
                          width: 40,
                          iconn: const Icon(Icons.cancel_outlined),
                          onTap: () {}),
                      const Text('Se canceló')
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              ButtonCustom1(
                  text: 'Cerrar',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  width: 100)
            ],
          ));
}

DetalleVisitasReal(context, index, data) {
  return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: const Text('Detalle de visita Real'),
            contentPadding: EdgeInsets.all(identidadMedidas(context, 'Pading')),
            children: [
              CustomSizedBox1(
                  title: 'ID:', value: data[index]['VIS_ID'].toString()),
              CustomSizedBox1(
                  title: 'Especialista:',
                  value: data[index]['VIS_ESPECIALISTA'].toString()),
              CustomSizedBox2(
                  title: 'Cliente:',
                  value: data[index]['CLI_NOMBRE'] +
                      ' (SAP:' +
                      data[index]['CLI_SAP'].toString() +
                      ')'),
              CustomSizedBox1(
                  title: 'Motivo de contacto:',
                  value:
                      '${data[index]['MOT_MOTIVO']} (${data[index]['VIS_MOTIVO_CONTACTO'].toString()})'),
              CustomSizedBox1(title: 'Fecha:', value: data[index]['REA_FECHA']),
              CustomSizedBox1(title: 'Hora:', value: data[index]['REA_HORA']),
              CustomSizedBox2(
                  title: 'Observación:', value: data[index]['VIS_OBSERVACION']),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      ButtonCustom2(
                          radius: 50,
                          height: 40,
                          width: 40,
                          iconn: const Icon(Icons.fact_check_outlined),
                          onTap: () {
                            irFormularioSeguimiento(
                                context, data[index]['VIS_ID']);
                          }),
                      const Text('Seguimiento')
                    ],
                  ),
                  Column(
                    children: [
                      ButtonCustom2(
                          buttonColor: identidadColor('Rojo'),
                          radius: 50,
                          height: 40,
                          width: 40,
                          iconn: const Icon(Icons.cancel_outlined),
                          onTap: () {}),
                      const Text('Se canceló')
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              ButtonCustom1(
                  text: 'Cerrar',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  width: 100)
            ],
          ));
}

DetalleVisitasCompleta(context, index, data, id) async {
  List data2 = await apiGET(context, 'seguimiento/$id');
  return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: const Text('Detalle de visita completa'),
            contentPadding: EdgeInsets.all(identidadMedidas(context, 'Pading')),
            children: [
              Column(
                children: [
                  CustomSizedBox1(
                      title: 'ID:', value: data[index]['VIS_ID'].toString()),
                  CustomSizedBox1(
                      title: 'Especialista:',
                      value: data[index]['VIS_ESPECIALISTA'].toString()),
                  CustomSizedBox2(
                      title: 'Cliente:',
                      value: data[index]['CLI_NOMBRE'] +
                          ' (SAP:' +
                          data[index]['CLI_SAP'].toString() +
                          ')'),
                  CustomSizedBox1(
                      title: 'Motivo de contacto:',
                      value:
                          '${data[index]['MOT_MOTIVO']} (${data[index]['VIS_MOTIVO_CONTACTO'].toString()})'),
                  CustomSizedBox1(
                      title: 'Fecha:', value: data[index]['REA_FECHA']),
                  CustomSizedBox1(
                      title: 'Hora:', value: data[index]['REA_HORA']),
                  CustomSizedBox2(
                      title: 'Observación:',
                      value: data[index]['VIS_OBSERVACION']),

                  //------------------------------------------------------------------------------------//

                  CustomSizedBox1(
                      title: 'Id de seguimiento:',
                      value: data2[0]['SEG_ID'].toString()),
                  CustomSizedBox2(
                      title: 'Resultado de seguimiento:',
                      value:
                          '${data2[0]['RES_RESULTADO']} (${data2[0]['SEG_RESULTADO'].toString()})\n ${data2[0]['SEG_RESULTADO_OTRO']}'),
                  CustomSizedBox2(
                      title: 'Razón del resultado:',
                      value:
                          '${data2[0]['RES_RAZON']}(${data2[0]['SEG_RAZON'].toString()})\n ${data2[0]['SEG_RAZON_OTRO']}'),
                  CustomSizedBox2(
                      title: 'Observación de seguimiento:',
                      value: data2[0]['SEG_OBSERVACION'].toString()),
                  const SizedBox(height: 16),
                  ButtonCustom1(
                      text: 'Cerrar',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      width: 300),
                ],
              ),
            ],
          ));
}

class ContenedorListView extends StatefulWidget {
  final String title;
  List visitasReales;
  List params;
  bool colorIndicators;

  ContenedorListView({
    super.key,
    required this.title,
    required this.visitasReales,
    required this.params,
    this.colorIndicators = false,
  });

  @override
  State<ContenedorListView> createState() => _ContenedorListViewState();
}

class _ContenedorListViewState extends State<ContenedorListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: identidadMedidas(context, 'Pading') * 4),
            child: ListView.builder(
                itemCount: widget.visitasReales.length,
                itemBuilder: (BuildContext context, int indexF1) {
                  var date = DateTime.parse(widget.visitasReales[indexF1][widget.params[2]]).toUtc();
                  return ListTile(
                    tileColor: widget.colorIndicators
                        ? date.difference(DateTime.now()).inDays < 0
                            ? Color(identidadColor('Rojo')) //Fechas Caducadas
                            : date.difference(DateTime.now()).inDays == 0
                                ? Color(identidadColor('Primario Azul')) //Hoy (Más precisamente un día de cercanía)
                                : Color(identidadColor('Blanco')) //El resto
                        : Color(identidadColor('blnco')),//Color predeterminado
                    title:
                        Text(widget.visitasReales[indexF1][widget.params[0]]),
                    subtitle: Text(widget.visitasReales[indexF1]
                            [widget.params[1]]
                        .toString()),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateTime.parse(widget.visitasReales[indexF1][widget.params[2]]).toString().substring(0, 10),
                          style: const TextStyle(
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic),
                        ),
                        Text(widget.visitasReales[indexF1][widget.params[3]],
                            style: const TextStyle(
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.italic))
                      ],
                    ),
                    selectedTileColor: Color(identidadColor('Gris')),
                    onTap: () {
                      widget.title == 'Visitas programadas'
                          ? DetalleVisitasPlan(
                              context, indexF1, widget.visitasReales)
                          : widget.title == 'Visitas reales'
                              ? DetalleVisitasReal(
                                  context, indexF1, widget.visitasReales)
                              : widget.title == 'Visitas Completadas'
                                  ? DetalleVisitasCompleta(
                                      context,
                                      indexF1,
                                      widget.visitasReales,
                                      widget.visitasReales[indexF1]['VIS_ID'])
                                  : '';
                    },
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(identidadMedidas(context, 'Pading') * 2),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(widget.title, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
