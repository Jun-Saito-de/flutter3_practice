import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  static var _message = 'ok.'; //static 変数 _message を定義。アプリ内で表示するメッセージ。
  static var _stars = '☆☆☆☆☆.';
  static var _star = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: アプリケーションの上部に表示されるタイトルバー
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: Color(0xffa260bf), // ← ここで背景色を設定
        leading: BackButton(color: Colors.white),
        actions: <Widget>[
          IconButton(
            onPressed: iconPressedA,
            icon: Icon(Icons.android),
            tooltip: 'add star…',
          ),
          IconButton(
            onPressed: iconPressedB,
            icon: Icon(Icons.favorite),
            tooltip: 'subtract star…',
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Center(
            child: Text(
              _stars,
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
          ),
        ),
      ),
      // Column: 画面の中央に縦に並べるウィジェット
      body: Center(
        child: Text(
          _message,
          style: const TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }

  void iconPressedA() {
    _message = 'tap "android".';
    _star++;
    update();
  }

  void iconPressedB() {
    _message = 'tap "favorite".';
    _star--;
    update();
  }

  void update() {
    _star = _star < 0 ? 0 : _star > 5 ? 5 : _star;
    setState(() {
      _stars = '★★★★★☆☆☆☆☆'.substring(5 - _star,
      5 - _star + 5);
      _message = _message + '[$_star]';
    });
  }
}
