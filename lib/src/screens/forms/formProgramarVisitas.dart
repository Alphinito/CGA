import 'package:cga/src/identidad/marca.dart';
import 'package:cga/src/printing/componentes.dart';
import 'package:flutter/material.dart';
import '../../logic/formProgramarVisita.dart';
import '../../printing/componentesFormularios.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../responses/status.dart';

class FormProgramarVisita extends StatefulWidget {
  const FormProgramarVisita({Key? key}) : super(key: key);

  @override
  State<FormProgramarVisita> createState() => _FormProgramarVisitaState();
}

class _FormProgramarVisitaState extends State<FormProgramarVisita> {

  //----------------------------------------------------------------------------|Obtención de datos
  List<dynamic> _clientes = [];
  List<dynamic> _motivos = [];
  bool _loading = true;

  Get() async {
    try{
      var res = await http.get(Uri.http("10.0.2.2:9000", "clientes"));
      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        setState(() {
          _clientes = jsonData;
          _loading = false;
        });
      }
    }catch(err){
      respuesta(context, 'error', 'Error!', '$err');
    }

    try{
      var res2 = await http.get(Uri.http("10.0.2.2:9000", "motivo"));
      if (res2.statusCode == 200) {
        var jsonData = jsonDecode(res2.body);
        setState(() {
          _motivos = jsonData;
          _loading = false;
        });
      }
    }catch(err){
      respuesta(context, 'error', 'Error!', '$err');
    }

  }
  //----------------------------------------------------------------------------|Variables de Status
  int _selectedIndexF1 = 0;
  int _selectedIndexF3 = 0;
  //int _selectedIndexF4 = 0;

  String _statusP1 = '';
  String _statusP3 = '';
  String _statusP4 = '';
  //----------------------------------------------------------------------------|Date y Time configuration
  var _currentSelectedTimeInicio = TimeOfDay.now();
  var _currentSelectedTimeFin = TimeOfDay.now();
  GetTimePikerWiguet(Guarda, TextoDeAyuda) {
    return showTimePicker(
        context: context,
        initialTime: Guarda,
        cancelText: 'Atras',
        confirmText: 'Guardar',
        helpText: TextoDeAyuda,
        builder: (BuildContext context, Widget? child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        });
  }
  void callTimePiker(InicioFin) async {
    if (InicioFin == 'inicio') {
      var selectedTime = await GetTimePikerWiguet(_currentSelectedTimeInicio, 'Hora de inicio');
      setState(() {
        _currentSelectedTimeInicio = selectedTime;
      });
    } else {
      var selectedTime = await GetTimePikerWiguet(_currentSelectedTimeFin,'Hora de finalización');
      setState(() {
        _currentSelectedTimeFin = selectedTime;
      });
    }
  }
  //----------------------------------------------------------------------------| Variables de Almacenamineto de datos
  int setCliente = 0;
  int setMotivo = 0;
  DateTime setFecha = DateTime.now();
  TimeOfDay setHoraInicio = TimeOfDay.now();
  TimeOfDay setHoraFin = TimeOfDay.now();
  final _detalle = TextEditingController();
  //----------------------------------------------------------------------------|


  @override
  void initState() {
    super.initState();
    Get();
  }
  @override
  //CONTENEDOR GENERAL HOME
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
            EdgeInsets.only(top: identidadMedidas(context, 'Pading') * 4),
            child: PageView(
              children: [
                Stack(
                  children: [
                    _clientes.isNotEmpty
                    ?ListView.builder(
                        itemCount: _clientes.length,
                        itemBuilder: (BuildContext context, int indexF1) {
                          return ListTile(
                            title: Text(_clientes[indexF1]['CLI_NOMBRE']),
                            subtitle: Text('NIT: ${_clientes[indexF1]['CLI_NIT']}'),
                            trailing: const Icon(Icons.add),
                            selectedTileColor: Color(identidadColor('Gris')),
                            selected: indexF1 == _selectedIndexF1,
                            onTap: () {
                              setState(() {
                                _selectedIndexF1 = indexF1;
                                _statusP1 = 'Activo';
                                setCliente = _clientes[indexF1]['CLI_ID'];
                              });
                            },
                          );
                        })
                    :Container(
                      color: Color(identidadColor('Rojo')),
                      child: const Text('NO HAY CLIENTES PARA MOSTRAR'),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: identidadMedidas(context, 'Width'),
                        padding: EdgeInsets.symmetric(
                            horizontal: identidadMedidas(context, 'Pading'),
                            vertical: 5),
                        color: Color(identidadColor('f9f9f9')),
                        child: const Text(
                          'Cliente',
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    _motivos.isNotEmpty
                    ?ListView.builder(
                        itemCount: _motivos.length,
                        itemBuilder: (BuildContext context, int indexF3) {
                          return ListTile(
                            title: Text(_motivos[indexF3]['MOT_MOTIVO']),
                            trailing: const Icon(Icons.add),
                            selectedTileColor: Color(identidadColor('Gris')),
                            selected: indexF3 == _selectedIndexF3,
                            onTap: () {
                              setState(() {
                                _selectedIndexF3 = indexF3;
                                _statusP3 = 'Activo';
                                setMotivo = _motivos[indexF3]['MOT_ID'];
                              });
                            },
                          );
                        })
                    :Container(
                      color: Color(identidadColor('Rojo')),
                      child: const Text('NO HAY MOTIVOS PARA MOSTRAR'),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: identidadMedidas(context, 'Width'),
                        padding: EdgeInsets.symmetric(
                            horizontal: identidadMedidas(context, 'Pading'),
                            vertical: 5),
                        color: Color(identidadColor('f9f9f9')),
                        child: const Text(
                          'Motivo de contacto',
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView(//---------------------------------------------------##|STEP 4 (Fecha y Observación)
                  children: [
                    CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2023),
                      onDateChanged: (date) {
                        setState(() {
                          setFecha = date;
                        });
                        print(setFecha);
                      },
                    ),
                    Row(//------------------------------------------------------|BOTONES DE HORA
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              identidadMedidas(context, 'Pading')),
                          width: identidadMedidas(context, 'Width') * 0.5,
                          child: Column(
                            children: [
                              const Text('Hora de inicio'),
                              ElevatedButton(
                                  onPressed: () {
                                    callTimePiker('inicio');
                                    setState(() {
                                      setHoraInicio = _currentSelectedTimeInicio;
                                    });
                                    print(setHoraInicio);
                                  },
                                  child: Text(_currentSelectedTimeInicio.format(context))),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(
                              identidadMedidas(context, 'Pading')),
                          width: identidadMedidas(context, 'Width') * 0.5,
                          child: Column(
                            children: [
                              const Text('Hora fin'),
                              ElevatedButton(
                                  onPressed: () {
                                    callTimePiker('fin');
                                    setState(() {
                                      setHoraFin = _currentSelectedTimeFin;
                                    });
                                    print(setHoraFin);
                                  },
                                  child: Text(_currentSelectedTimeFin.format(context))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(//------------------------------------------------|CAMPO DE TEXTO
                      margin:
                      EdgeInsets.all(identidadMedidas(context, 'Pading')),
                      padding: EdgeInsets.symmetric(horizontal: identidadMedidas(context, 'Pading') * 0.5),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(identidadColor('Primario Azul')),
                          ),
                          color: Color(identidadColor('Gris'))),
                      child: TextFormField(
                        controller: _detalle,
                        maxLines: 4,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(identidadMedidas(context, 'Pading') * 2),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const Text('Programar visita', style: TextStyle(fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      indicadoresDeAvance(status: _statusP1),
                      indicadoresDeAvance(status: _statusP3),
                      indicadoresDeAvance(status: _statusP4),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(identidadMedidas(context, 'Pading')),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonCustom1(text: 'SAVE', onTap: (){enviarDatosDeFormulario(context,setCliente,setMotivo,setFecha,setHoraInicio.format(context),setHoraFin.format(context),_detalle.text);}, width: 100),
            ),
          )
        ],
      ),
    );
  }
}