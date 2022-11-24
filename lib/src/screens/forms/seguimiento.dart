import 'package:cga/src/identidad/marca.dart';
import 'package:cga/src/printing/componentes.dart';
import 'package:flutter/material.dart';
import '../../logic/formularios.dart';
import '../../printing/componentesFormularios.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../data/globals.dart' as globals;
import '../../responses/status.dart';

class FormSeguimiento extends StatefulWidget {
  @override
  State<FormSeguimiento> createState() => _FormSeguimientoState();
}

class _FormSeguimientoState extends State<FormSeguimiento> {
  //----------------------------------------------------------------------------|Obtención de datos
  List<dynamic> _resultados = [];
  List<dynamic> _razones = [];
  bool _loading = true;
  bool _isButtonDisabled = true;

  Get() async {
    try {
      var res = await http.get(Uri.http(globals.linkAPI, "resultados"));
      if (res.statusCode == 200) {
        var jsonData = jsonDecode(res.body);
        setState(() {
          _resultados = jsonData;
          _loading = false;
        });
      }
    } catch (err) {
      respuesta(context, 'error', 'Error!', '$err');
    }

    try {
      var res2 = await http.get(Uri.http(globals.linkAPI, "razones"));
      if (res2.statusCode == 200) {
        var jsonData = jsonDecode(res2.body);
        setState(() {
          _razones = jsonData;
          _loading = false;
        });
      }
    } catch (err) {
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

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  ToPage(page) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  habilitarButton(){
    if(_statusP1 == 'Activo' && _statusP3 == 'Activo'){
      setState(() {
        _isButtonDisabled = false;
      });
    }

  }
  _counterButtonPress(argumentID) {
    if (_isButtonDisabled) {
      return null;
    } else {
      return enviarDatosDeSeguimiento(context, argumentID, setResultado, setResultadoOTRO.text, setRazon, setRazonOTRO.text, _detalle.text);
    }
  }


  //----------------------------------------------------------------------------| Variables de Almacenamineto de datos
  int setResultado = 8;
  final setResultadoOTRO = TextEditingController();
  int setRazon = 8;
  final setRazonOTRO = TextEditingController();
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
    final argumentID = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: identidadMedidas(context, 'Pading') * 4),
            child: PageView(
              controller: _pageController,
              children: [
                Stack(
                  children: [
                  ListView.builder(
                            itemCount: _resultados.length,
                            itemBuilder: (BuildContext context, int indexF1) {
                              return ListTile(
                                title:
                                    Text(_resultados[indexF1]['RES_RESULTADO']),
                                trailing: const Icon(Icons.add),
                                selectedTileColor:
                                    Color(identidadColor('Gris')),
                                selected: indexF1 == _selectedIndexF1,
                                onTap: () {
                                  setState(() {
                                    _selectedIndexF1 = indexF1;
                                    _statusP1 = 'Activo';
                                    setResultado = _resultados[indexF1]['RES_ID'];
                                    ToPage(1);
                                    habilitarButton();
                                  });
                                },
                              );
                            }),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(identidadColor('Gris'))
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: identidadMedidas(context, 'Pading')*0.8),
                              child: TextFormField(
                                maxLines: 2,
                                onTap: () {
                                  setState(() {
                                    _statusP1 = 'Activo';
                                    habilitarButton();
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Otro:',
                                  border: InputBorder.none,
                                ),
                                controller: setResultadoOTRO,
                              ),
                            ),
                          )),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: identidadMedidas(context, 'Width'),
                        padding: EdgeInsets.symmetric(
                            horizontal: identidadMedidas(context, 'Pading'),
                            vertical: 5),
                        color: Color(identidadColor('f9f9f9')),
                        child: const Text(
                          'Resultado',
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    _razones.isNotEmpty
                        ? ListView.builder(
                            itemCount: _razones.length,
                            itemBuilder: (BuildContext context, int indexF3) {
                              return ListTile(
                                title: Text(_razones[indexF3]['RES_RAZON']),
                                trailing: const Icon(Icons.add),
                                selectedTileColor:
                                    Color(identidadColor('Gris')),
                                selected: indexF3 == _selectedIndexF3,
                                onTap: () {
                                  setState(() {
                                    _selectedIndexF3 = indexF3;
                                    _statusP3 = 'Activo';
                                    setRazon = _razones[indexF3]['RES_RAZ_ID'];
                                    ToPage(2);
                                    habilitarButton();
                                  });
                                },
                              );
                            })
                        : Container(
                            color: Color(identidadColor('Rojo')),
                            child: const Text('NO HAY MOTIVOS PARA MOSTRAR'),
                          ),
                    Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(identidadColor('Gris'))
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: identidadMedidas(context, 'Pading')*0.8),
                              child: TextFormField(
                                maxLines: 2,
                                onTap: () {
                                  setState(() {
                                    _statusP3 = 'Activo';
                                    habilitarButton();
                                  });
                                },
                                decoration: const InputDecoration(
                                  labelText: 'Otro:',
                                  border: InputBorder.none,
                                ),
                                controller: setRazonOTRO,
                              ),
                            ),
                          )),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: identidadMedidas(context, 'Width'),
                        padding: EdgeInsets.symmetric(
                            horizontal: identidadMedidas(context, 'Pading'),
                            vertical: 5),
                        color: Color(identidadColor('f9f9f9')),
                        child: const Text(
                          'Razon',
                          style: TextStyle(
                              fontSize: 18, fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    ListView(
                      //---------------------------------------------------##|STEP 4 (Fecha y Observación)
                      children: [
                        Container(
                          //------------------------------------------------|CAMPO DE TEXTO
                          margin:
                              EdgeInsets.all(identidadMedidas(context, 'Pading')),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  identidadMedidas(context, 'Pading') * 0.5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(identidadColor('Primario Azul')),
                              ),
                              color: Color(identidadColor('Gris'))),
                          child: TextFormField(
                            controller: _detalle,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Observación:',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(identidadMedidas(context, 'Pading')),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: ButtonCustom1(
                                text: 'SAVE',
                                onTap: () {
                                  _counterButtonPress(argumentID);
                                },
                                width: 100),
                          ),
                        )
                      ],
                    ),
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
                  Text('Seguimiento a visita: ${argumentID.toString()}',
                      style: const TextStyle(fontSize: 18)),
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
        ],
      ),
    );
  }
}
