import 'package:flutter/material.dart';
import 'package:flutter_component/flutter_component.dart';

class ImagesViewExample extends StatefulWidget {
  @override
  _ImagesViewExampleState createState() => _ImagesViewExampleState();
}

class _ImagesViewExampleState extends State<ImagesViewExample> {
  List<String> imagesPath = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImagesView'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GridView.builder(
        itemCount: imagesPath.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ImagesView(
                            isShowIndex: true,
                            imagesPath: imagesPath,
                            index: index,
                            width: MediaQuery.of(context).size.width,
                            imageType: ImageType.assets,
                          )));
            },
            child: Hero(tag: imagesPath[index], child: Image.asset(imagesPath[index])),
          );
        },
      ),
    );
  }
}
