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

          body: Center(
            child: Text(
              _message,
              style: const TextStyle(fontSize: 22.0,
              ),
            )
          ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          backgroundColor: Colors.lightBlueAccent,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                label: 'Android',
                icon: Icon(Icons.android, color: Colors.black, size: 50),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(Icons.favorite, color: Colors.black, size: 50),
            ),
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home, color: Colors.black, size: 50),
            ),
          ],
        onTap: tapBottomIcon,
      ),
        );
  }

  void tapBottomIcon(int value) {
    var items = ['Android', 'Heart', 'Home'];
    setState(() {
      _index = value;
      _message = 'you tapped: "' + items[_index] + '".';
    });
  }
}
