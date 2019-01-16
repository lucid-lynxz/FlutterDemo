# route 页面跳转

## 参考资源
[官网navigation-basics](https://flutter.io/docs/cookbook/navigation/navigation-basics)
[官网named-routes](https://flutter.io/docs/cookbook/navigation/named-routes)

## named-routes
### 1. 在 [MaterialApp] 构造方法中预先定义好名称以及对应的页面信息

```dart
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Pagess'),
      routes: <String, WidgetBuilder>{
        "RouteDemoPage": (BuildContext context) => RouteDemoPage(),
        "NamedRoutePage": (BuildContext context) => NamedRoutePage()
      },
    );
  }
}
```

另外,如果使用了 `initialRoute` 属性(或者定义了 `/` 路由名称),则不可再使用 `home` 属性,否则报错
```dart
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) =>
            MyHomePage(title: "Flutter Demo Home Page"),
      },
    );
  }
}
```

### 2. 使用
```dart
Navigator.pushNamed(context, "NamedRoutePage");
Navigator.of(context).pushNamed("NamedRoutePage");
```
## push单纯跳转
```dart
Navigator.push(context, MaterialPageRoute(builder: (context) => RoutePage3()));
Navigator.of(context).push(MaterialPageRoute(builder: (context) => RoutePage3()))

// 跳转新页面并关闭其他页面
Navigator.of(context).pushNamedAndRemoveUntil("RouteDemoPage", (route) => route == null)
                          
Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                              builder: (context) =>
                                  RoutePage2("from NamedRoutePage")),
                              (route) => route == null);
```

## pop关闭页面
```dart
Navigator.pop(context);
```

