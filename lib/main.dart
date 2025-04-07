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
  static var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: アプリケーションの上部に表示されるタイトルバー
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: Colors.lightBlueAccent, // ← ここで背景色を設定
      ),
      body: Column(
        children: <Widget>[
          Text(
            _message,
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.android, size: 32),
                title: const Text(
                  'first item',
                  style: TextStyle(fontSize: 28),
                ),
                selected: _index == 1,
                onTap: () {
                  setState(() {
                    _index = 1;
                    tapTile();
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.android, size: 32),
                title: const Text(
                  'second item',
                  style: TextStyle(fontSize: 28),
                ),
                selected: _index == 2,
                onTap: () {
                  setState(() {
                    _index = 2;
                    tapTile();
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.android, size: 32),
                title: const Text(
                  'third item',
                  style: TextStyle(fontSize: 28),
                ),
                selected: _index == 3,
                onTap: () {
                  setState(() {
                    _index = 3;
                    tapTile();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void tapTile() {
    // メッセージの更新
setState(() {
  _message = 'you tapped: No, $_index.';
});
  }
}
