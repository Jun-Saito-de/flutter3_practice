import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Flutterのアプリケーション全体をラップするStatelessWidget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //Flutterアプリの基本的な設定（テーマ、ナビゲーション、画面遷移）を管理
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
        canvasColor: const Color(0xfffafafa),
      ),
      home: MyHomePage(), // 最初に表示されるウィジェットを指定します。この場合、MyHomePage()というホームページが表示
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// State<MyHomePage>を継承
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,255,255,255),
      appBar: AppBar(
        title: const Text('App Name', style: TextStyle(fontSize: 30.0),
        ),
      ),
        body: Container(
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
    );
  }
}

class MyPainter extends CustomPainter {

  @override
void paint(Canvas canvas, Size size){
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 0, 200, 255);
    Rect r = Rect.fromLTWH(50.0, 50.0, 150.0, 150.0);
    canvas.drawRect(r, p);

    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10.0;
    r = Rect.fromLTWH(100, 100, 150, 150);
    canvas.drawRect(r, p);

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 0, 150, 75);
    Offset ctr = Offset(250.0, 350.0);
    canvas.drawCircle(ctr, 50.0, p);

    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150, 55, 50, 255);
    p.strokeWidth = 10.0;
    r = Rect.fromLTWH(20, 270, 150, 200);
    canvas.drawOval(r,p);

    p.strokeWidth = 3.0;
    for (var i = 0; i <= 10; i++){
      Rect r = Rect.fromLTRB(
          50.0 + 20 * i, 50.0,
          50.0, 250.0 - 20 * i);
      canvas.drawLine(r.topLeft, r.bottomRight, p);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
