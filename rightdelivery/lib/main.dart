import 'package:flutter/material.dart';
import 'package:rightdelivery/screens/home.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.green),
      title: 'Ronpibon Food',
      home: Home(),
    );
  }
}