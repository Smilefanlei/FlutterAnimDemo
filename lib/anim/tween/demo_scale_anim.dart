import 'package:flutter/material.dart';

class ScaleAnim extends StatefulWidget {
  @override
  _ScaleAnimState createState() => _ScaleAnimState();
}
// ignore: slash_for_doc_comments

class _ScaleAnimState extends State<ScaleAnim>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animWidth;
  Animation<double> animHeight;

  Animation<double> animScale;

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
        title: Text("缩放动画"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                  width: animWidth.value,
                  height: animHeight.value,
                  color: Colors.amber,
                  child: Center(
                    child: Text("缩放动画"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ScaleTransition(
                scale: animScale,
                child: Center(
                  child: Container(
                    width: 200,
                    height: 50,
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text("缩放动画"),
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
    animWidth = new Tween<double>(
      begin: 100,
      end: 300,
    ).animate(_controller);
    animWidth.addListener(() {
      setState(() {});
    });

    animHeight = new Tween<double>(
      begin: 50,
      end: 150,
    ).animate(_controller);

    animScale = new Tween<double>(
      begin: 1,
      end: 1.5,
    ).animate(_controller);

    animWidth.addStatusListener((status) {
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

    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
