import 'package:flutter/material.dart';

import 'package:flutter_component/flutter_component.dart';

class CarouselExample extends StatefulWidget {
  @override
  _CarouselExampleState createState() => _CarouselExampleState();
}

class _CarouselExampleState extends State<CarouselExample> {
  List<String> str = ['111', '222', '333'];
  List<Color> color = [Colors.blue, Colors.orange, Colors.red, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播图'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: Carousel(
              autoPlay: true,
              dotSize: 6.0,
              showIndicators: true,
              viewportFraction: 0.8,
              children: color.map((item) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: FlutterLogo(
                      colors: item,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            height: 200.0,
            child: Carousel(
              autoPlay: true,
              children: str.map((text) {
                return Center(child: Text(text));
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
