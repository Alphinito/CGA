import 'package:flutter/material.dart';

class ClientView extends StatelessWidget {
  const ClientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vista del cliente"),
      ),
      body: const Center(
        child: Text("CONTENIDO"),
      ),
    );
  }
}
