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
  static ValueNotifier<int> _value = ValueNotifier<int>(0);

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
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: MyPainter(_value),
                child: Center(),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
              ElevatedButton(
                child: Text("Click",
                  style: TextStyle(fontSize: 32),),
                  onPressed: ()=>_value.value++, //ボタンが押されたら _value.value++ によって、カウントが1増えます。
    ),
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final ValueNotifier<int> _value;

  MyPainter(this._value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(50, 0, 200, 100);
    Rect r;
    for (var i = 0; i < _value.value; i++) {
      r = Rect.fromLTWH(10 + i * 20, 10 + i * 20, 100, 100);
      canvas.drawRect(r, p);
    }
    r = Rect.fromLTWH(0, 0, size.width, size.height);
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(255, 100, 100, 100);
    canvas.drawRect(r, p);
    if (_value.value > 10) _value.value = 0;
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}