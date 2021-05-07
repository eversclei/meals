import 'package:flutter/material.dart';

class MealsHomePage extends StatefulWidget {
  @override
  _MealsHomePageState createState() => _MealsHomePageState();
}

class _MealsHomePageState extends State<MealsHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
