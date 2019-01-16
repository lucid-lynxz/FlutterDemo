import 'package:flutter/material.dart';
import './pages/RouteDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) =>
            MyHomePage(title: "Flutter Demo Home Page"),
        "RouteDemoPage": (BuildContext context) => RouteDemoPage(),
        "NamedRoutePage": (BuildContext context) => RoutePage1()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:\n开始学习flutter,每天抽点时间来完成吧',
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 200, 125, 125),
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.greenAccent,
                  decorationStyle: TextDecorationStyle.solid),
            ),
            FlatButton(
                onPressed: () {
                  // 使用命名路由进行跳转,路由名称需要预先定义在 MyApp 中
                  Navigator.of(context).pushNamed("RouteDemoPage");
                },
                child: Container(
                  color: Colors.lightBlue,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "go RouteDemoPage",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Stack(
              alignment: FractionalOffset(0.5, 0.9),
              children: <Widget>[
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(
                      "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=183502922,2574005110&fm=26&gp=0.jpg"),
                ),
                Container(
                  color: Colors.lightBlue,
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "我喜欢编程",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
