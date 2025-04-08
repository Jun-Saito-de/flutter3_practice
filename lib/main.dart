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
  // ウィジェットが生成される際に呼ばれ、
  // ウィジェットの状態を管理するStateオブジェクトを返す
  _MyHomePageState createState() => _MyHomePageState();
}

// State<MyHomePage>を継承
class _MyHomePageState extends State<MyHomePage> {
  static var _items = <Widget>[];
  static var _message = 'ok.';
  static var _tapped = 0;

  @override
  // initState()は、ウィジェットの初期化処理を行うメソッドです。ここでは、タブコントローラを初期化
  void initState() {
    super.initState();
    for (var i = 0; i < 5; i++) {
      var item = ListTile(
        leading: const Icon(Icons.android),
        title: Text('No, $i'),
        onTap: () {
          _tapped = i;
          tapItem();
        },
      );
      _items.add(item);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 画面上部に表示されるアプリケーションのバー。タイトルとタブバーを設定。
        title: const Text('Flutter App'),
      ),
        body: Center(
          child: Text(
              _message,
          style: const TextStyle(
            fontSize: 32.0,
          ),
        ),
    ),
    drawer: Drawer(
    child: ListView(
    shrinkWrap:  true,
    padding: const EdgeInsets.all(20.0),
    children: _items,
    ),
    ),
    );
  }

  void tapItem() {
    Navigator.pop(context);
    setState(() {
      _message = 'tapped:[$_tapped]';
    });
  }
}
