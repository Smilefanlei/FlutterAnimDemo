import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlareAnimPage extends StatefulWidget {
  @override
  _FlareAnimPageState createState() => _FlareAnimPageState();
}

class _FlareAnimPageState extends State<FlareAnimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flare动画(官方推荐)"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: FlareActor(
                "assets/anim/Filip.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: 'idle',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
