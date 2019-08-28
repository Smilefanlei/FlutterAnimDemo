import 'package:flutter/material.dart';

class DragAnimPage extends StatefulWidget {
  @override
  _DragAnimPageState createState() => _DragAnimPageState();
}

class _DragAnimPageState extends State<DragAnimPage> {

  double mDx = 0;
  double mDy = 0;

  GlobalKey _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖拽动画"),
        centerTitle: true,
      ),
      body: Container(
        child: Transform.translate(
          offset: Offset(mDx, mDy),
          child: GestureDetector(
            onPanUpdate: (dragUpdateDetails) {
              mDx = dragUpdateDetails.globalPosition.dx;
              mDy = dragUpdateDetails.globalPosition.dy;
              setState(() {});
            },
            child: Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              color: Colors.indigoAccent,
              key: _globalKey,
              child: Text("拖拽"),
            ),
          ),
        ),
      ),
    );
  }
}
