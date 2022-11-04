import 'dart:convert';
import 'package:cga/src/printing/componentes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<dynamic> _users = [];
  bool _loading = false;
  final _nombre = TextEditingController();
  final _cargo = TextEditingController();
  final headers = {"Content-Type": "application/json;charset=UTF-8"};

  Get() async {
    var res = await http.get(Uri.http("10.0.2.2:9000", "api"));
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      setState(() {
        _users = jsonData;
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Get();
  }

  //CONTENEDOR GENERAL HOME
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF0080C4),
            elevation: 0,
            title: Row(
              children: [
                Image.asset(
                  'Asets/img/logo.png',
                  width: 35,
                  color: Colors.white,
                ),
                const Text(
                  " CGA",
                  style: TextStyle(fontFamily: 'Kabel'),
                )
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.portrait_outlined))
            ],
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.receipt_long)),
              Tab(icon: Icon(Icons.add_chart)),
              Tab(icon: Icon(Icons.add_call))
            ]),
          ),
          body: TabBarView(children: [
            home_inicio(),
            home_visitasForm(),
            const Icon(Icons.add_chart),
            const Icon(Icons.add_call),
          ])),
    );
  }

  //HOME / INICIO
  home_inicio() {
    return Center(
      child: Stack(
        children: [
          ListView(children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  _users.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: _users.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Text("Usuario: "),
                                Column(
                                  children: [
                                    Text(_users[index]['user_nombre']),
                                    Text(_users[index]['user_cargo']),
                                  ],
                                ),
                              ],
                            );
                          },
                        )
                      : Container(
                          child: Center(
                              child: _loading
                                  ? ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Data not Found"),
                                    )
                                  : CircularProgressIndicator()
                          ),
                        )
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }

  //HOME / INICIO
  home_visitasForm(){
    return Column(
      children: [
        TextFormField(
          controller: _nombre,
        ),
        TextFormField(
          controller: _cargo,
        ),
        ButtonCustom1(text: "Enviar", onTap: ()async{
          final body = {"user_nombre": _nombre.text, "user_cargo": _cargo.text};
          await http.post(Uri.http("10.0.2.2:9000", "api"), headers: headers, body: jsonEncode(body),);
          _nombre.clear();
          _cargo.clear();
          Get();
        })
      ],
    );
  }
}
