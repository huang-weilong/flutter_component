import 'package:flutter/material.dart';
import 'package:flutter_component_example/example/images_view_example.dart';

import 'example/date_pick_example.dart';
import 'example/carousel_example.dart';
import 'example/circle_progress_example.dart';
import 'example/wave_progress_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Component Example'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('时间选择器'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => DatePickExample()));
            },
          ),
          ListTile(
            title: Text('轮播图'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CarouselExample()));
            },
          ),
          ListTile(
            title: Text('圆形进度条'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CircleProgressExample()));
            },
          ),
          ListTile(
            title: Text('波浪进度条'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => WaveProgressExample()));
            },
          ),
          ListTile(
            title: Text('图片查看'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ImagesViewExample()));
            },
          )
        ],
      ),
    );
  }
}
