import 'package:flutter/material.dart';

class CustomAnimBuildPage extends StatefulWidget {
  @override
  _CustomAnimBuildPageState createState() => _CustomAnimBuildPageState();
}

class _CustomAnimBuildPageState extends State<CustomAnimBuildPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Animation<Color> colorAnim;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(
      begin: 50,
      end: 200,
    ).animate(_controller);

    colorAnim = ColorTween(begin: Colors.amber, end: Colors.deepPurple)
        .animate(_controller);

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
        title: Text("AnimatedBuilder"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: _CustomTransition(
            child: Icon(
              Icons.android,
              size: 50,
              color: Colors.green,
            ),
            animation: animation,
            colorAnim: colorAnim,
          ),
        ),
      ),
    );
  }
}

class _CustomTransition extends StatelessWidget {
  Widget child;
  Animation<double> animation;
  Animation<Color> colorAnim;

  _CustomTransition({this.child, this.animation, this.colorAnim});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget widget) {
          return Container(
            color: colorAnim.value,
            width: animation.value,
            height: animation.value,
            child: Transform.translate(
              offset: Offset(animation.value-50, 0),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
