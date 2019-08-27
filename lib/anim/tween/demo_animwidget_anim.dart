import 'package:flutter/material.dart';

class AnimWidgetPage extends StatefulWidget {
  @override
  _AnimWidgetPageState createState() => _AnimWidgetPageState();
}

class _AnimWidgetPageState extends State<AnimWidgetPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  CurvedAnimation _curved;
  Animation<double> _anim;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
    _curved = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _anim = Tween<double>(begin: 1, end: 5).animate(_curved);
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
        centerTitle: true,
        title: Text("AnimatedWidget"),
      ),
      body: Container(
        child: Center(
          child: CustomAnimWidget(
            animation: _anim,
          ),
        ),
      ),
    );
  }
}

class CustomAnimWidget extends AnimatedWidget {
  CustomAnimWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        height: 200,
        width: 200,
        child: ScaleTransition(
          scale: animation,
          child: Icon(
            Icons.android,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
