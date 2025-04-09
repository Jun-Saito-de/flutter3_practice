import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('App Name', style: TextStyle(fontSize: 30.0),),
      ),
      body:Container(
        child: CustomPaint(
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textDirection: TextDirection.ltr),
    )
      ..pushStyle(ui.TextStyle(color:Colors.red, fontSize: 48.0))
      ..addText('Hello! ')
      ..pushStyle(ui.TextStyle(color: Colors.blue[700],fontSize: 30.0))
      ..addText('This is a sample of paragraph text. ')
      ..pushStyle(ui.TextStyle(color: Colors.blue[200],fontSize: 30.0))
      ..addText('You can draw MULTI-FONT text! ');

    ui.Paragraph paragraph = builder.build()
      ..layout(ui.ParagraphConstraints(width:300.0));

    final double textWidth = paragraph.maxIntrinsicWidth;
    final double textHeight = paragraph.height;

    Offset circleOffset = Offset(200.0, 200.0);
    p.color = Color.fromARGB(100, 200, 205, 255);
    canvas.drawCircle(circleOffset, 175.0, p);
    Offset textOffset = Offset(70, 150.0 - 50.0);
    canvas.drawParagraph(paragraph, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
