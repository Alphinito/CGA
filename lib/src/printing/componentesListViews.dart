import 'package:cga/src/printing/componentes.dart';
import 'package:flutter/material.dart';
import '../api/apiMethods.dart';
import '../identidad/marca.dart';
import '../logic/formularios.dart';
import '../responses/status.dart';
import '../data/globals.dart' as globals;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(value)
        ],
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
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 5),
          Text(value)
        ],
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
    Navigator.of(context).pop();
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
    Navigator.of(context).pop();
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
                  value: data[index]['VIS_MOTIVO_CONTACTO'].toString()),
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
                  value: data[index]['VIS_MOTIVO_CONTACTO'].toString()),
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

DetalleVisitasCompleta(context, index, data, id) async{
  List data2 = await apiGET(context,'seguimiento/$id');
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
                      value: data[index]['VIS_MOTIVO_CONTACTO'].toString()),
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
                      value: '${data2[0]['SEG_RESULTADO'].toString()}\n ${data2[0]['SEG_RESULTADO_OTRO']}'
                          ),
                  CustomSizedBox2(
                      title: 'Razón del resultado:',
                      value: '${data2[0]['SEG_RAZON'].toString()}\n ${data2[0]['SEG_RAZON_OTRO']}'),
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

  ContenedorListView({
    super.key,
    required this.title,
    required this.visitasReales,
    required this.params,
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
                  return ListTile(
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
                          DateTime.parse(widget.visitasReales[indexF1]
                                  [widget.params[2]])
                              .toString()
                              .substring(0, 10),
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
                                      context, indexF1, widget.visitasReales, widget.visitasReales[indexF1]['VIS_ID'])
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
