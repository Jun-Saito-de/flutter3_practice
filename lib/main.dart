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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: アプリケーションの上部に表示されるタイトルバー
      appBar: AppBar(
        title: Text('App Name'),
      ),
      // Column: 画面の中央に縦に並べるウィジェット
      body: Center(
        child: Column(
          // mainAxisAlignment: 子ウィジェットの配置を縦方向（メイン軸）に調整
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: 子ウィジェットのサイズを縦方向（メイン軸）で最大化
          mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: 子ウィジェットの横方向（クロス軸）の配置を調整
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              // Padding: 内側の余白を設定。20.0の余白を周囲に追加
              padding: EdgeInsets.all(20.0),
              child: Text(
                _message,
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.0),
            ),

            Padding(
                padding: EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed:buttonPressed,
                    child: Text(
                      "tap me!",
                      style: TextStyle(fontSize:32.0,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

  void buttonPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          SimpleDialog(
            title: const Text("Select assignment"),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text('One'),
                onPressed: () => Navigator.pop<String>(context, 'One'),
              ),
              SimpleDialogOption(
                child: const Text('Two'),
                onPressed: () => Navigator.pop<String>(context, 'Two'),
              ),
              SimpleDialogOption(
                child: const Text('Three'),
                onPressed: () => Navigator.pop<String>(context, 'Three'),
              ),
            ],
          ),
    ).then<void>((value) => resultAlert(value));
  }
  void resultAlert(String value) {
    setState(() {
      _message = "selected: $value";
    });
  }
}
