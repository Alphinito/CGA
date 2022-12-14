import 'package:cga/src/screens/clientScreen.dart';
import 'package:cga/src/screens/forms/formProgramarVisitas.dart';
import 'package:cga/src/screens/forms/formProgramarVisitsaBeta.dart';
import 'package:cga/src/screens/forms/formVisitaReal.dart';
import 'package:cga/src/screens/forms/seguimiento.dart';
import 'package:cga/src/screens/home.dart';
import 'package:cga/src/screens/login.dart';
import 'package:cga/src/screens/views/visitaCompleta.dart';
import 'package:cga/src/screens/views/visitaPlan.dart';
import 'package:cga/src/screens/views/visitaReal.dart';
import 'package:flutter/material.dart';
import 'identidad/marca.dart';

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
        primaryColor: Color(identidadColor('Primario Azul')),
      ),
      initialRoute: "/login",
      //initialRoute: "/home",
      routes: {
        "/home": (BuildContext context) => const Home(),
        "/login": (BuildContext context) => const Login(),
        "/clientView": (BuildContext context) => const ClientView(),
        "/formProgramarVisita": (BuildContext context) => const FormProgramarVisita(),
        "/formVisitaReal": (BuildContext context) => const FormVisitaReal(),
        "/ViewListVisitaReal": (BuildContext context) => const VisitaRealListView(),
        "/ViewListVisitaPlan": (BuildContext context) => const VisitaPlanListView(),
        "/ViewListVisitaCompletada": (BuildContext context) => const VisitaCompletaListView(),
        "/formSeguimiento": (BuildContext context) => FormSeguimiento(),
      },
    );
  }
}
