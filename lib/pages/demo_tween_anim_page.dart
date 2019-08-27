import 'package:flutter/material.dart';

class TweenAnimDemo extends StatefulWidget {
  @override
  _TweenAnimDemoState createState() => _TweenAnimDemoState();
}

class _TweenAnimDemoState extends State<TweenAnimDemo>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/transferAnim');
          },
          textColor: Colors.black87,
          child: Text("位移"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/rotateAnim');
          },
          textColor: Colors.black87,
          child: Text("旋转"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/scaleAnim');
          },
          textColor: Colors.black87,
          child: Text("缩放"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/fadeAnim');
          },
          textColor: Colors.black87,
          child: Text("透明度"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/nonlinearAnim');
          },
          textColor: Colors.black87,
          child: Text("非线性曲线"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/animWidgetPage');
          },
          textColor: Colors.black87,
          child: Text("可重用动画"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/combinationAnimPage');
          },
          textColor: Colors.black87,
          child: Text("组合动画"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/customAnimBuildPage');
          },
          textColor: Colors.black87,
          child: Text("自定义变换"),
        ),
      ],
    );
  }
}
