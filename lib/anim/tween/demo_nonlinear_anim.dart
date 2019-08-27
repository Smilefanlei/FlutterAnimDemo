import 'package:flutter/material.dart';

class NonlinearAnim extends StatefulWidget {
  @override
  _NonlinearAnimState createState() => _NonlinearAnimState();
}

class _NonlinearAnimState extends State<NonlinearAnim>
    with SingleTickerProviderStateMixin {
  // 位移
  AnimationController _animController;
  CurvedAnimation _translateCurved;
  Animation<double> _translateAnim;

  CurvedAnimation _scaleCurved;
  Animation<double> _scaleAnim;

  // 旋转

  CurvedAnimation _rotationCurved;
  Animation<double> _rotationAnim;

  // 透明度
  CurvedAnimation _opacityCurved;
  Animation<double> _opacityAnim;

  @override
  void initState() {
    _initTransfer();
    _initScale();
    _initRotation();
    _initOpacity();
    _initListener();
    super.initState();
  }

  @override
  void dispose() {
    _animController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("非线性曲线动画"),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (!_animController.isAnimating) {
                  _animController.forward();
                }
              },
              child: Container(
                color: Colors.amber,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text("bounceOut"),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Transform.translate(
                        offset: Offset(0, _translateAnim.value),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

//            GestureDetector(
//              onTap: (){
//                _animController.forward();
//              },
//              child: ,
//            ),
            GestureDetector(
              onTap: () {
                _animController.forward();
              },
              child: Container(
                color: Colors.cyan,
                child: Center(
                  child: Container(
                    width: _scaleAnim.value,
                    height: _scaleAnim.value,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _animController.forward();
              },
              child: Container(
                color: Colors.green,
                child: Center(
                  child: RotationTransition(
                    turns: _rotationAnim,
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
//            AnimatedOpacity(opacity: null, duration: null)

            Container(
              color: Colors.indigoAccent,
              child: Center(
                child: Opacity(
                  opacity:_getOpacityValue(_opacityAnim.value),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initTransfer() {
    _animController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _translateCurved =
        CurvedAnimation(parent: _animController, curve: Curves.bounceOut);
    _translateAnim = Tween<double>(
      begin: 0,
      end: -100,
    ).animate(_translateCurved);

    _translateAnim.addListener(() {
      setState(() {});
    });
  }

  void _initScale() {
    _scaleCurved =
        CurvedAnimation(parent: _animController, curve: Curves.easeInOutBack);
    _scaleAnim = Tween<double>(
      begin: 40,
      end: 140,
    ).animate(_scaleCurved);
  }

  void _initRotation() {
    _rotationCurved =
        CurvedAnimation(parent: _animController, curve: Curves.easeInOutBack);
    _rotationAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_rotationCurved);
  }

  void _initOpacity() {
    _opacityCurved =
        CurvedAnimation(parent: _animController, curve: Curves.elasticInOut);
    _opacityAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_opacityCurved);
  }

  double _getOpacityValue(double opacity) {
    double temp = 0;
    if (opacity < 0) {
      temp = 0;
      return temp;
    }
    if (opacity > 1) {
      temp = 1;
      return temp;
    }
    temp = opacity;
    return temp;
  }

  void _initListener() {
    _animController.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          _animController.forward();
          break;
        case AnimationStatus.forward:
        // TODO: Handle this case.
          break;
        case AnimationStatus.reverse:
        // TODO: Handle this case.
          break;
        case AnimationStatus.completed:
          _animController.reverse();
          break;
      }
    });

    _animController.forward();
  }
}
