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
  // Offset: x, y 座標を表すクラス
  static List<Offset> _points = []; // タップされた位置をすべて記録するリスト。画面に描画する位置の元になる

  @override
  // 初期化処理
  void initState(){
    super.initState();
  }

  @override
  // 画面構築
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('App Name', style: TextStyle(fontSize: 30.0),),
        ),
        body: Center(


          child: Listener(  // Listener: タップイベントを拾うウィジェット。
            onPointerDown: _addPoint, // onPointerDown に _addPoint 関数を登録しており、タップ位置が記録される。
            child: CustomPaint( //実際の描画処理を行うウィジェット。
              painter: MyPainter(_points), // タップ位置のリストを渡して描画を担当。
              child: Center(),
            ),
          ),
        )
    );
  }
  void _addPoint(PointerDownEvent event) {
    setState(() {
      _points.add(event.localPosition);
    });
  }
}

class MyPainter extends CustomPainter {
  final List<Offset> _points;

  MyPainter(this._points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(100, 0, 200, 100);
    for(var pos in _points) {
      Rect r = Rect.fromLTWH(pos.dx -25, pos.dy - 25, 50.0, 50.0);
      canvas.drawOval(r,p);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}