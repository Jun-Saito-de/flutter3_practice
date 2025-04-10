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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin { // SingleTickerProviderStateMixin はアニメーション制御に必要。
  late Animation<double> animation;
  late AnimationController controller; // アニメーションの再生・停止を管理。

  @override

  // pageStateクラスの初期化を行うinitState
  void initState() {
    super.initState();
    controller = AnimationController( // controller は3秒で一周するアニメーションを定義。
        duration: const Duration(seconds: 3), // durationはアニメーションの間隔を調整
        vsync: this // イベントの通知を受け取TIckerProviderを指定
    );
    animation = Tween<double>(begin: 0, end: pi*2).animate(controller) // Tween(begin: 0, end: pi*2) で、0〜360度（2πラジアン）まで回転
      ..addListener(() { // .addListener() で値が更新されるたびに setState() を呼び出し、再描画
        setState(() {
        });
      });
    controller.repeat(reverse: false); // controller.repeat() でループ再生しています（逆回転なし）。
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('App Name', style: TextStyle(fontSize: 30.0),),
      ),
      body: Center(
        child:Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: MyPainter(animation.value),
                child: Center(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter{
  final double value;

  MyPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    canvas.save();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(100, 255, 0, 255);
    Rect r = Rect.fromLTWH(0,0,250, 250);
    canvas.translate(150, 250);
    canvas.rotate(value);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);

    canvas.restore();
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 25;
    p.color = Color.fromARGB(100, 0, 255, 255);
    r = Rect.fromLTWH(0,0,250, 250);
    canvas.translate(150, 250);
    canvas.rotate(value * -1);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}