import 'package:flutter/material.dart';

import 'package:flutter_component/flutter_component.dart';

class WaveProgressExample extends StatefulWidget {
  @override
  _WaveProgressExampleState createState() => _WaveProgressExampleState();
}

class _WaveProgressExampleState extends State<WaveProgressExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('波浪进度条'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: SizedBox(
          width: 200.0,
          height: 200.0,
          child: WaveProgress(
            percent: 0.8,
            primaryColor: Colors.blue,
            secondaryColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
