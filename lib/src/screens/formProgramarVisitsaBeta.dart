import '../data/globals.dart' as globals;
import 'package:flutter/material.dart';
import '../printing/componentesFormularios.dart';

class FormProgramarVisitaBeta extends StatefulWidget {
  const FormProgramarVisitaBeta({Key? key}) : super(key: key);

  @override
  State<FormProgramarVisitaBeta> createState() => _FormProgramarVisitaState();
}

class _FormProgramarVisitaState extends State<FormProgramarVisitaBeta> {

  static xsxd(retorno){
    var uno;
    retorno == 'widget' ? uno = Steps(datoPrincipal: 'Nombre Cliente', datoSecundario: 'Empresa', stepTitle: 'Clientes', count: 10) : uno = Steps(datoPrincipal: 'Nombre Cliente', datoSecundario: 'Empresa', stepTitle: 'Clientes', count: 10).statusP1;
    return uno;
  }
  List<Widget> StepsList = [
    xsxd('widget'),
    Steps(datoPrincipal: 'Motivo', datoSecundario: 'Texto adicional', stepTitle: 'Motivo de contacto', count: 10),
    StepDateTime(),
  ];

  xd(List valuesStatus){
    String _statusP1 = valuesStatus[0];
    String _statusP2 = valuesStatus[1];
    String _statusP3 = valuesStatus[2];
    List<String> Variables = [_statusP1,_statusP2,_statusP3];
   return  Variables;
  }

  int _selectedIndexF1 = 0;
  int _selectedIndexF2 = 0;
  int _selectedIndexF3 = 0;
  //int _selectedIndexF4 = 0;

  @override
  //CONTENEDOR GENERAL
  Widget build(BuildContext context) {
    String IndicatorStatus1 = xsxd('status');
    print(IndicatorStatus1);
    List<String> valuesStatus = [IndicatorStatus1,globals.IndicatorStatus2,globals.IndicatorStatus3];
    return ContenedorDeFormulario(contentSteps: StepsList, variablesDeEstadoParaIndicadores: xd(valuesStatus));
  }
}
