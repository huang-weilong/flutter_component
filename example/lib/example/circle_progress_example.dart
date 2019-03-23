import 'package:flutter/material.dart';

import 'package:flutter_component/flutter_component.dart';

class CircleProgressExample extends StatefulWidget {
  @override
  _CircleProgressExampleState createState() => _CircleProgressExampleState();
}

class _CircleProgressExampleState extends State<CircleProgressExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('圆形进度条'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: SizedBox(
          width: 200.0,
          height: 200.0,
          child: CircleProgress(
            progress: 0.75,
            primaryColor: Colors.blue,
            secondaryColor: Colors.black12,
          ),
        ),
      ),
    );
  }
}
