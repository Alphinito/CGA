import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];
  Map usersData = {};
  Geta() async {
    print(
        "xda-------------------------------------------------------------------------------------------------------------------------------------");
    var response = await http.get(Uri.parse('http://10.0.2.2:9000/api'));
    print(response.body);
    data = json.decode(response.body);
    print(
        "xde-------------------------------------------------------------------------------------------------------------------------------------");
    setState(() {
      usersData = data[0];
    });
  }

  @override
  void initState() {
    super.initState();
    print("xd");
    Geta();
  }

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
              Tab(icon: Icon(Icons.contact_mail_sharp)),
              Tab(icon: Icon(Icons.access_alarms_rounded)),
              Tab(icon: Icon(Icons.add_chart)),
              Tab(icon: Icon(Icons.add_call))
            ]),
          ),
          body: TabBarView(children: [
            home_inicio(),
            const Icon(Icons.access_alarms_rounded),
            const Icon(Icons.add_chart),
            const Icon(Icons.add_call),
          ])),
    );
  }

  home_inicio() {
    return Center(
      child: Stack(
        children: [
          Column(
            children: [
              Text(
                "Get()",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
              ListView.builder(
                itemCount: 149,
                itemBuilder: (BuildContext context, int index) {
                  return Text(usersData['user_id']);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
