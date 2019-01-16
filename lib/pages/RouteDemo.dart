import 'package:flutter/material.dart';

/// 页面跳转demo
/// 主要包括两个概念: route 和 navigator , 主要有以下两种使用方式
/// 1. 可以使用命名路由进行跳转,需要预先在 app 中进行定义, main.dart 中 MyApp routes定义
///     Navigator.of(context).pushNamed("RouteDemoPage");
/// 2. 不用预先定义在 app 中,需要的时候直接构建跳转
///     Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
//        return new SecondPage(title:"参数");
//      }))
class RouteDemoPage extends StatelessWidget {
  final List<String> titles = ["named route", "不带参数跳转", "带参数跳转", "返回键监听"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("routeDemoPage"),
      ),
      body: Center(
        child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: titles.length,
            itemBuilder: (context, i) {
              return Container(
                  color: Colors.lightBlue,
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("${titles[i]}",
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      _navigateTo(context, i);
                    },
                  ));
            }),
      ),
    );
  }

  void _navigateTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushNamed(context, "NamedRoutePage");
      // Navigator.of(context).pushNamed("NamedRoutePage");
    } else if (index == 1) {
      // 不带参数
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RoutePage3()));
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoutePage3()))
    } else if (index == 2) {
      // 带参数
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RoutePage2("来自RouteDemoPage的标题")));
    } else if (index == 3) {
      // 弹出页面,返回上一级
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RoutePage3()));
    }
  }
}

class RoutePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NamedRoutePage1"),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("具名路由: 需预先定义在app中"),
              RaisedButton(
                  child: Text("跳转 RoutePage2"),
                  onPressed: () =>
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              RoutePage2("from NamedRoutePage")))),
              RaisedButton(
                  child: Text("跳转 RoutePage2 页面并关闭其他页面"),
                  onPressed: () =>
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  RoutePage2("from NamedRoutePage")),
                              (route) => route == null)),
              RaisedButton(
                  child: Text("跳转到 RouteDemoPage 页面并关闭其他页面"),
                  onPressed: () =>
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "RouteDemoPage", (route) => route == null))
            ],
          )),
    );
  }
}

class RoutePage2 extends StatelessWidget {
  final String title;

  RoutePage2(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RoutePage3 $title"),
      ),
      body: Center(child: Text("普通路由跳转: \n1.无需预先定义在app中;\n2.传值更方便")),
    );
  }
}

class RoutePage3 extends StatelessWidget {
  final String title;
  final int pageIndex;

  // 可选参数
  RoutePage3({this.title, this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RoutePage4"),
      ),
      body: Center(
          child: RaisedButton(
              child: Text("点击返回"),
              onPressed: () {
                Navigator.pop(context);
              })),
    );
  }
}
