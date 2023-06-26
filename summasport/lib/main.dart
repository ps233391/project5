import 'package:summasport/pages/oefeningen/oefeningen_index.dart';
import 'package:summasport/pages/onderdelen/onderdelen_index.dart';
import 'package:summasport/pages/HomeScreen.dart';
import 'package:summasport/pages/License.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChampionsApp());
}

class ChampionsApp extends StatelessWidget {
  const ChampionsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.green,
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.info)),
                Tab(icon: Icon(Icons.accessibility_new_rounded)),
                Tab(icon: Icon(Icons.hourglass_top)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              HomeScreen(),
              licensepage(),
              oefeningenindex(),
              OnderdelenIndex(),
            ],
          ),
        ),
      ),
    );
  }
}
