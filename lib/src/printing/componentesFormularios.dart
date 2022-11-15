import 'package:flutter/material.dart';
import '../identidad/marca.dart';

//-----------------------------------------------------------------------------|INDICADORES DE AVANCE PARA FORMULARIOS
class indicadoresDeAvance extends StatelessWidget {
  colorReturn(status) {
    if (status == 'Activo') {
      return Color(identidadColor('Primario Azul'));
    } else {
      return Colors.transparent;
    }
  }

  final String status;
  indicadoresDeAvance({
    super.key,
    required this.status,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: colorReturn(status),
          border: Border.all(color: Color(identidadColor('Primario Azul'))),
          borderRadius: const BorderRadius.all(Radius.circular(80))),
    );
  }
}

//-----------------------------------------------------------------------------|CONTENEDOR PARA FORMULARIOS
class ContenedorDeFormulario extends StatefulWidget {

  final List<Widget> contentSteps;
  final List variablesDeEstadoParaIndicadores;
  ContenedorDeFormulario({
    super.key,
    required this.contentSteps,
    required this.variablesDeEstadoParaIndicadores,
  });

  @override
  State<ContenedorDeFormulario> createState() => _ContenedorDeFormularioState();
}

class _ContenedorDeFormularioState extends State<ContenedorDeFormulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
            EdgeInsets.only(top: identidadMedidas(context, 'Pading') * 4),
            child: PageView(
              children: widget.contentSteps,
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
                      for (var _statusP in widget.variablesDeEstadoParaIndicadores)
                        indicadoresDeAvance(status: _statusP),
                    ]
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------------------|STEPS PARA FORMULARIOS
class Steps extends StatefulWidget {

  final String datoPrincipal;
  final String datoSecundario;
  final String stepTitle;
  final int count;
  int _selectedIndexF1 = 0;
  String statusP1 = '';
  Steps({
    super.key,
    required this.datoPrincipal,
    required this.datoSecundario,
    required this.stepTitle,
    this.count = 1,
    this.statusP1 = ''
  });

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(//---------------------------------------##|STEP 1 (Cliente)
            itemCount: widget.count,
            itemBuilder: (BuildContext context, int indexF1) {
              return ListTile(
                title: Text('${widget.datoPrincipal} $indexF1'),
                subtitle: Text(widget.datoSecundario),
                trailing: const Icon(Icons.add),
                selectedTileColor: Color(identidadColor('Gris')),
                selected: indexF1 == widget._selectedIndexF1,
                onTap: () {
                  setState(() {
                    widget._selectedIndexF1 = indexF1;
                    widget.statusP1 = 'Activo';
                  });
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
              widget.stepTitle,
              style: const TextStyle(
                  fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
    );
  }
}

//-----------------------------------------------------------------------------|STEP CUSTOM
class StepDateTime extends StatefulWidget {


  @override
  State<StepDateTime> createState() => _StepDateTimeState();
}

class _StepDateTimeState extends State<StepDateTime> {
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

  @override
  Widget build(BuildContext context) {
    return ListView(//---------------------------------------------------##|STEP 4 (Fecha y Observación)
      children: [
        CalendarDatePicker(
          initialDate: DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2023),
          onDateChanged: (date) {},
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
            maxLines: 5,
          ),
        )
      ],
    );
  }
}


