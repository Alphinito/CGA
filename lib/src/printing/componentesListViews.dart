import 'package:cga/src/printing/componentes.dart';
import 'package:flutter/material.dart';

import '../identidad/marca.dart';

DetalleObjet(context, text1, text2, text3) {
  return showDialog(context: context, builder: (context)=> SimpleDialog(
    title: Text(text1),
    contentPadding: EdgeInsets.all(identidadMedidas(context, 'Pading')),
    children: [
      SizedBox(height: 60, width: 321, child: Text(text2),),
      SizedBox(height: 60, width: 321, child: Text(text2),),
      SizedBox(height: 60, width: 321, child: Text(text3),),
      SizedBox(height: 60, width: 321, child: Text(text3),),
      Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.dangerous)),
          IconButton(onPressed: (){}, icon: Icon(Icons.dangerous)),
          IconButton(onPressed: (){}, icon: Icon(Icons.dangerous)),
        ],
      ),
      ButtonCustom1(text: 'Cerrar', onTap: (){Navigator.of(context).pop();},width: 100)
    ],
  ) );
}


class ContenedorListView extends StatefulWidget {
  final String title;
  VoidCallback onTap;
  List visitasReales;
  List params;

  ContenedorListView({
    super.key,
    required this.title,
    required this.onTap,
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
                    subtitle:
                        Text(widget.visitasReales[indexF1][widget.params[1]]),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.visitasReales[indexF1][widget.params[2]],
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
                      DetalleObjet(context, 'text1', 'text2', 'text3');
                      setState(() {});
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
