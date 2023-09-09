import 'package:flutter/material.dart';

import 'home_view.dart';

void main() {
  runApp(const TicTac());
}

class TicTac extends StatelessWidget {
  const TicTac({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
theme: ThemeData(
brightness: Brightness.dark,
primarySwatch: Colors.blue,
primaryColor:const Color(0xff00061a),
shadowColor: const Color(0xff001456),
splashColor: const Color(0xff4169e8),
),
home:const  HomeView(),
    );
  }
}