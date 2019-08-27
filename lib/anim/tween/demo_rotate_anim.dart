import 'package:flutter/material.dart';

class RotateAnim extends StatefulWidget {
  @override
  _RotateAnimState createState() => _RotateAnimState();
}
// ignore: slash_for_doc_comments

class _RotateAnimState extends State<RotateAnim>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Matrix4> anim;

  Animation<double> doubleAnim;

  @override
  void initState() {
    super.initState();
    _initAnim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("旋转动画"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  transform: anim.value,
                  width: 200,
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                    child: Text("旋转动画矩阵变换"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: RotationTransition(
                  turns: doubleAnim,
                  child: Container(
                    width: 200,
                    height: 50,
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text("旋转动画Rotation"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initAnim() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );
    anim = new Matrix4Tween(
      begin: Matrix4.rotationZ(0),
      end: Matrix4.rotationZ(2.0),
    ).animate(_controller);
    anim.addListener(() {
      setState(() {});
    });

    anim.addStatusListener((status) {
      debugPrint('fanlei => $status');
      switch (status) {
        case AnimationStatus.dismissed:
          _controller?.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
        case AnimationStatus.completed:
          _controller?.reverse();
          break;
      }
    });

    doubleAnim = Tween<double>(
      begin: 0,
      end: 1.0,
    ).animate(_controller);

    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
