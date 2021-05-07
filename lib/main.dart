import 'package:flutter/material.dart';
import './home_page.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MealsHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
