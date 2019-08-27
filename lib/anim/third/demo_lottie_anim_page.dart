import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

class LottieAnimPage extends StatefulWidget {
  @override
  _LottieAnimPageState createState() => _LottieAnimPageState();
}

class _LottieAnimPageState extends State<LottieAnimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie动画"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: LottieView.fromFile(
            filePath: "assets/anim/8075-the-frog-to-drive.json",
            autoPlay: true,
            loop: true,
            reverse: true,
            onViewCreated: (lottieController) {

            },
          ),
        ),
      ),
    );
  }
}
