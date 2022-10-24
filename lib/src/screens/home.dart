import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF2587C9),
            elevation: 0,
            title: Row(
              children: const [Icon(Icons.adb), Text(" CGA")],
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
            Icon(Icons.access_alarms_rounded),
            Icon(Icons.add_chart),
            Icon(Icons.add_call),
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
                "Dash board o centro de control",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
