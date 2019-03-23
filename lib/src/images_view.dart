import 'dart:io';

import 'package:flutter/material.dart';

/// [assets] 资源文件图片，[file] 手机文件图片
enum ImageType { assets, file }

class ImagesView extends StatefulWidget {
  ImagesView({
    @required this.imagesPath,
    @required this.index,
    @required this.width,
    this.imageType: ImageType.file,
    this.isShowIndex: false,
    this.padding: const EdgeInsets.only(top: 30.0),
  });

  // 图片路径
  final List<String> imagesPath;
  // 当前点击图片的下标
  final int index;
  // 图片宽度（使用屏幕宽）
  final double width;
  // 图片类型
  final ImageType imageType;
  // 是否显示图片下标
  final bool isShowIndex;
  // 下标padding
  final EdgeInsetsGeometry padding;

  @override
  _ImagesViewState createState() => _ImagesViewState();
}

class _ImagesViewState extends State<ImagesView> {
  PageController controller;
  int index = 0;
  double dragDownLeft = 0.0; //滑动开始时的left
  bool half = false; //是否超过一半

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: widget.index);
    index = widget.index + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          imagesView(widget.width, widget.imagesPath.length),
          widget.isShowIndex
              ? Padding(
                  padding: widget.padding,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '$index/${widget.imagesPath.length}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget imagesView(width, length) {
    List<Widget> array = [];
    widget.imagesPath.forEach((item) {
      array.add(
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          onDoubleTap: () {
            // 后续添加双击缩放效果
          },
          onHorizontalDragDown: (DragDownDetails e) {
            dragDownLeft = e.globalPosition.dx;
          },
          onHorizontalDragUpdate: (DragUpdateDetails e) {
            imgMove(e.globalPosition.dx, width);
          },
          onHorizontalDragEnd: (DragEndDetails e) {
            moveEnd(e.primaryVelocity, width, length);
          },
          child: Hero(
            tag: item,
            child: widget.imageType == ImageType.file ? Image.file(File(item), width: width) : Image.asset(item, width: width),
          ),
        ),
      );
    });
    return PageView(
      controller: controller,
      physics: NeverScrollableScrollPhysics(),
      children: array,
    );
  }

  /// [velocity]沿主轴的移动速度 左滑为负数 右滑为正数
  void moveEnd(double velocity, double width, int length) {
    if (velocity > 10 && index > 1) {
      lastPage(width);
    } else if (velocity < -10 && index < length) {
      nextPage(width);
    } else if (half) {
      if (dragDownLeft > width / 2 && index < length) {
        // 右滑动超过一半，则下一张
        nextPage(width);
      } else if (dragDownLeft < width / 2 && index > 1) {
        lastPage(width);
      } else {
        controller.animateTo(
          (index - 1) * width,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      }
    } else {
      controller.animateTo(
        (index - 1) * width,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    }
  }

  /// [currentLeft] 滑动过程中实时的left距离
  void imgMove(double currentLeft, double width) {
    double now = (index - 1) * width;
    double move = currentLeft - dragDownLeft; // 滑动距离

    if (currentLeft - dragDownLeft > width / 2 || dragDownLeft - currentLeft > width / 2) {
      half = true;
    } else {
      half = false;
    }
    controller.jumpTo(now - move);
  }

  void nextPage(double width) {
    setState(() {
      index = index + 1;
      controller.animateTo(
        (index - 1) * width,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }

  void lastPage(double width) {
    setState(() {
      index = index - 1;
      controller.animateTo(
        (index - 1) * width,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    });
  }
}
