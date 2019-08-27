import 'package:flutter/material.dart';

class FadeAnim extends StatefulWidget {
  @override
  _FadeAnimState createState() => _FadeAnimState();
}
// ignore: slash_for_doc_comments

class _FadeAnimState extends State<FadeAnim>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> anim;

  Animation<double> fadeTransition;

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
        title: Text("透明度动画"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Opacity(
                  opacity: anim.value,
                  child: Container(
                    width: 200,
                    height: 50,
                    color: Colors.amber,
                    child: Center(
                      child: Text("透明度动画"),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: FadeTransition(
                  opacity: fadeTransition,
                  child: Container(
                    width: 200,
                    height: 50,
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text("透明度动画"),
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
    anim = new Tween<double>(
      begin: 1,
      end: 0.2,
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

    fadeTransition = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
