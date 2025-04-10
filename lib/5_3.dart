




import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/5_3.dart';

void main() {
  runApp(const MaterialSampleApp());
}

class MaterialSampleApp extends StatelessWidget {
  const MaterialSampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Offset> _points = [];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('App Name', style: TextStyle(fontSize: 30.0),),
        ),
        body: Center(
          child: Listener(
            onPointerDown: _addPoint,
            child: customPaint(
              painter: MyPainter(_points),
              child: Center(),
            ),
          ),
        )
    );
  }
  void _addPoint(PointerDown)
}