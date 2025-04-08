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
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin { // アニメーションのためのTickerを提供するミックスイン
// タブのリストを定義
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'One'), // タブに表示する文字を指定
    Tab(text: 'Two'),
    Tab(text: 'Three'),
  ];

  // TabController**は、タブの動作を管理するために使うオブジェクトです。タブの切り替えやアニメーションの動作を制御します。
  // lateというキーワードは、変数が遅延初期化されることを意味します。
  // TabControllerを保管するための、_tabControllerフィールドが設定されている
  late TabController _tabController;

  @override
  // initState()は、ウィジェットの初期化処理を行うメソッドです。ここでは、タブコントローラを初期化
  void initState() {
   super.initState();
   _tabController = TabController( // タブの切り替えやアニメーションを管理するためのコントローラー。アニメーションを正常に動作させるために、vsyncを指定します。
     vsync: this, // アニメーションの同期をとるために使います。thisを指定することで、現在のウィジェットがその役割を担います。
     length: tabs.length // リストの長さ（タブの数）を指定します。タブの数に合わせてTabControllerを設定
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 画面上部に表示されるアプリケーションのバー。タイトルとタブバーを設定。
        title: Text('My App'),
        bottom: TabBar( // タブを管理するウィジェット
            controller: _tabController, // controllerでTabControllerを指定
            tabs: tabs // タブを表示するためにtabsリストを指定
        ),
      ),

      body: TabBarView( // TabBarViewは、タブに対応するビューを表示するウィジェット
          controller: _tabController, // controllerに_tabControllerを指定して、タブの選択状態とビューの表示を同期
          children: tabs.map((Tab tab){ //各タブに対応するウィジェットを作成し、リストとして渡しています
            return createTab(tab);
          }).toList(),
      ),
    );
  }

  Widget createTab(Tab tab) { // 各タブに表示する内容を作成します。引数として渡されたTabオブジェクトに基づいて、タブごとに異なるテキストを表示
    return Center(
      child: Text(
        'This is "${tab.text}" Tab.', // tab.textを使って、タブの名前（One、Two、Three）を表示
        style: const TextStyle(
          fontSize: 32.0,
          color: Colors.blue,
        ),
      ),
    );
  }
}