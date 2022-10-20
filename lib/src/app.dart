
import 'package:flutter/material.dart';
import '../main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CGA Aplication',
      theme: ThemeData(fontFamily: 'Karla',canvasColor: Colors.black54),
      home: const MyHomePage(title: 'CGA Yuju ya funciona'),
    );
  }
}