import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App with Name',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _counter = 0;
  String _name = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Counter App'),
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 名前入力フィールド
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Enter your name'),
                onChanged: (value){
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
            //　ボタン
            ElevatedButton(
              onPressed: (){
                setState(() {
                  _counter++;
                });
              },
              child: Text('Click'),
            ),
            // 数値入力フィールド
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text('$_counter',
                  style: TextStyle(fontSize: 32.0),)),
            ),
            // 結果画面に遷移するボタン
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen(name: _name, counter: _counter,
                ),
                ),
              );
            },
                child: Text('次のページへ'),
            ),
          ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String name;
  final int counter;

  SecondScreen({required this.name, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('結果'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('こんにちは$nameさん！'),
            Text('あなたは$counter回クリックしました'),
          ],
        ),
      ),
    );
  }
}