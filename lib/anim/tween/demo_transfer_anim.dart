import 'package:flutter/material.dart';

class TransferAnim extends StatefulWidget {
  @override
  _TransferAnimState createState() => _TransferAnimState();
}

// ignore: slash_for_doc_comments
/**
 * 这个实现 实际上是改变 父容器的padding/margin完成的
 */
class _TransferAnimState extends State<TransferAnim>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<EdgeInsets> anim;

  Animation<Offset> slideTransition;

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
        title: Text("位移动画"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: anim.value,
              child: Center(
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.amber,
                  child: Center(
                    child: Text("位移动画"),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: SlideTransition(
                  position: slideTransition,
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.amber,
                    child: Center(
                      child: Text("位移动画"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
    anim = new EdgeInsetsTween(
      begin: EdgeInsets.only(left: 0, top: 0),
      end: EdgeInsets.only(left: 100, top: 150),
    ).animate(_controller);

    //Offset  这里解释一下，是相对于自己移动的比例倍数
    slideTransition = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 2),
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

    _controller?.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
