import 'package:cga/src/identidad/marca.dart';
import 'package:cga/src/printing/componentes.dart';
import 'package:flutter/material.dart';
import '../logic/formProgramarVisita.dart';
import '../printing/componentesFormularios.dart';

class FormProgramarVisita extends StatefulWidget {
  const FormProgramarVisita({Key? key}) : super(key: key);

  @override
  State<FormProgramarVisita> createState() => _FormProgramarVisitaState();
}

class _FormProgramarVisitaState extends State<FormProgramarVisita> {

  int _selectedIndexF1 = 0;
  int _selectedIndexF2 = 0;
  int _selectedIndexF3 = 0;
  //int _selectedIndexF4 = 0;

  String _statusP1 = '';
  String _statusP2 = '';
  String _statusP3 = '';
  String _statusP4 = '';

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

  String setNombre = '';
  String setMotivo = '';
  DateTime setFecha = DateTime.now();
  TimeOfDay setHoraInicio = TimeOfDay.now();
  TimeOfDay setHoraFin = TimeOfDay.now();
  String setObservacion = '';



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
                    ListView.builder(
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int indexF1) {
                          return ListTile(
                            title: Text('Nombre cliente $indexF1'),
                            subtitle: Text('Empresa'),
                            trailing: Icon(Icons.add),
                            selectedTileColor: Color(identidadColor('Gris')),
                            selected: indexF1 == _selectedIndexF1,
                            onTap: () {
                              setState(() {
                                _selectedIndexF1 = indexF1;
                                _statusP1 = 'Activo';
                                setNombre = indexF1.toString();
                              });
                              print(setNombre);
                            },
                          );
                        }),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: identidadMedidas(context, 'Width'),
                        padding: EdgeInsets.symmetric(
                            horizontal: identidadMedidas(context, 'Pading'),
                            vertical: 5),
                        color: Color(identidadColor('f9f9f9')),
                        child: Text(
                          'Cliente',
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int indexF2) {
                      return ListTile(
                        title: Text('Clase de contacto $indexF2'),
                        subtitle: Text('Textro explicativo'),
                        trailing: Icon(Icons.add),
                        selectedTileColor: Color(identidadColor('Gris')),
                        selected: indexF2 == _selectedIndexF2,
                        onTap: () {
                          setState(() {
                            _selectedIndexF2 = indexF2;
                            _statusP2 = 'Activo';
                          });
                        },
                      );
                    }),
                ListView.builder(
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int indexF3) {
                      return ListTile(
                        title: Text('Motivo de contacto $indexF3'),
                        subtitle: Text('Texto explicativo'),
                        trailing: Icon(Icons.add),
                        selectedTileColor: Color(identidadColor('Gris')),
                        selected: indexF3 == _selectedIndexF3,
                        onTap: () {
                          setState(() {
                            _selectedIndexF3 = indexF3;
                            _statusP3 = 'Activo';
                          });
                        },
                      );
                    }),
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
                              Text('Hora de inicio'),
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
                              Text('Hora fin'),
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
                  Text('Crear visita', style: TextStyle(fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      indicadoresDeAvance(status: _statusP1),
                      indicadoresDeAvance(status: _statusP2),
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
              child: ButtonCustom1(text: 'SAVE', onTap: (){enviarDatosDeFormulario(context,setNombre,setMotivo,setFecha,setHoraInicio.format(context),setHoraFin.format(context),setObservacion);}, width: 100),
            ),
          )
        ],
      ),
    );
  }
}