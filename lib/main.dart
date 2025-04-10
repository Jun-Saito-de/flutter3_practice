// import 'dart:math';

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

// State クラス内に flg（フラグ）を定義。
class _MyHomePageState extends State<MyHomePage> {
bool flg = false; // false なら「右寄せ」、true なら「左寄せ」になるように制御します。
// この flg をもとに、四角形の位置が切り替わります。

  @override
  Widget build(BuildContext context) { // UIを構築する部分です。
    return Scaffold( // Scaffold によってアプリのベース構造を作成。
      appBar: AppBar(
        title: Text('App Name', style: TextStyle(fontSize: 30.0),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child:Column(
          children: [
                AnimatedContainer(
                    duration: const Duration(seconds: 3),
                    color: flg ? Colors.red : Colors.yellow,
                    width: flg ? 100 : 300,
                    height: flg ? 300 : 100,
                  ),
              ],
            ),
        ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState((){ // setState() によりUIが再構築され、AnimatedAlign が自動で再実行されて四角形が動きます。
          flg = !flg; // 押すと flg の値が反転（true → false、またはその逆）。
        });
      },
        child: const Icon(Icons.star),
      ),
    );
}
}
