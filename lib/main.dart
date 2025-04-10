import 'dart:math';

import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,255,255,255),
      appBar: AppBar(
        title: const Text("App Name", style: TextStyle(fontSize: 30.0),),
      ),
      body: Container(
        child: CustomPaint(
          painter:MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    Rect r = Rect.fromLTWH(50.0, 50.0, 75.0, 75.0);
    path.addOval(r);
    r = Rect.fromLTWH(75.0, 75.0, 125.0, 125.0);
    path.addOval(r);
    r = Rect.fromLTWH(125.0, 125.0, 175.0, 175.0);
    path.addOval(r);

    canvas.save();

    Paint p = Paint();
    p.color = Color.fromARGB(150, 255, 0, 0);
    p.style = PaintingStyle.fill;
    canvas.drawPath(path,p);

    canvas.translate(0.0, 150.0);
    p.color = Color.fromARGB(150, 0, 0, 255);
    canvas.drawPath(path,p);

    p.color = Color.fromARGB(150, 0, 255, 0);
    canvas.rotate(-0.5 * pi);
    canvas.translate(-500.0, 50.0);
    canvas.scale(1 * 1.5);
    canvas.drawPath(path,p);

    canvas.restore();

    Path triangle = Path();
    triangle.moveTo(100, 100);
    triangle.lineTo(150, 150);
    triangle.lineTo(200, 100);
    triangle.close(); // 三角形を閉じる
    Paint tp = Paint();
    tp.color = Color.fromARGB(250, 255, 250, 70);
    tp.style = PaintingStyle.fill;
    canvas.drawPath(triangle,tp);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
