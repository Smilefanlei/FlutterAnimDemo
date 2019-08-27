import 'package:flutter/material.dart';

class CombinationAnimPage extends StatefulWidget {
  @override
  _CombinationAnimPageState createState() => _CombinationAnimPageState();
}

class _CombinationAnimPageState extends State<CombinationAnimPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  // 曲线
  CurvedAnimation _curvedAnimation;

  // 缩放
  Animation<double> _scaleAnim;

  // 旋转
  Animation<double> _rotationAnim;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 2000));
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _scaleAnim = Tween<double>(
      begin: 1,
      end: 5,
    ).animate(_curvedAnimation);
    _rotationAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_curvedAnimation);

    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          _controller.forward();
          break;
        case AnimationStatus.forward:
          // TODO: Handle this case.
          break;
        case AnimationStatus.reverse:
          // TODO: Handle this case.
          break;
        case AnimationStatus.completed:
          _controller.reverse();
          break;
      }
    });

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("组合动画"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnim,
            child: RotationTransition(
              turns: _rotationAnim,
              child: Icon(
                Icons.android,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
