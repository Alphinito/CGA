import 'package:cga/src/screens/home.dart';
import 'package:cga/src/screens/login.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CGA Aplication',
      theme: ThemeData(
        fontFamily: 'Karla',
        primaryColor: const Color(0xFF2587C9),
      ),
      initialRoute: "/login",
      routes: {
        "/home":(BuildContext context) => home(),
        "/login":(BuildContext context) => Login()
      },
    );
  }
}