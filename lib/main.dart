import 'package:cga/src/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.red),
        title: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                height: 20,
                width: 20,
                child: Image.network('https://scontent.fbog3-2.fna.fbcdn.net/v/t1.6435-9/95829489_2995622097183484_7024444821066481664_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=TMJvSambxmMAX9UCuca&_nc_ht=scontent.fbog3-2.fna&oh=00_AT9SOua0nJyEKRaimOwB8WEN2r8xJbFOM9htqMLn5vXLKw&oe=6376C56A'),
              ),
              Text(widget.title)],
        ),
        backgroundColor: const Color(0xff2587C9),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(8),
              height: 200,
              width: 200,
              child: Image.network('https://img.freepik.com/vector-premium/numero-marcador-mecanico-establecido-contador-tiempo-reloj-plegable-temporizador-alarma-contador-mecanico-numerico-fecha-dia-puntuacion-ilustracion-vector-simbolo-digito-visualizacion-tiempo-aislado-sobre-fondo-blanco_419341-135.jpg?w=996'),
            ),
            const Text(
              'Tu has presionado el botón estas veces:',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              '$_counter',
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'xd',
        child: const Icon(Icons.pan_tool_alt_rounded),
      ),
    );
  }
}
