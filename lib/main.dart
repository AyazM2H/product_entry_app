import 'package:flutter/material.dart';
import 'package:productlist/screens/production_list.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Production List',
      theme: ThemeData(
        colorSchemeSeed: Colors.greenAccent
      ),
      home: ProductionList(),
    );
  }
}
