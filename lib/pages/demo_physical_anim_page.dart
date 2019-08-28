import 'package:flutter/material.dart';

class PhysicalAnimDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/animatedListSample');
            },
            textColor: Colors.black87,
            child: Text("列表动画"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/heroAnimation');
            },
            textColor: Colors.black87,
            child: Text("共享元素动画"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/dragAnimPage');
            },
            textColor: Colors.black87,
            child: Text("拖拽动画"),
          ),
        ],
      ),
    );
  }
}
