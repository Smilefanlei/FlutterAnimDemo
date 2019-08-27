import 'package:flutter/material.dart';

class ThirdAnimDemo extends StatelessWidget {
  // https://pub.dev/packages/flare_flutter#-readme-tab-

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/lottieAnimPage');
            },
            textColor: Colors.black87,
            child: Text("Lottie"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/flareAnimPage');
            },
            textColor: Colors.black87,
            child: Text("Flare"),
          )
        ],
      ),
    );
  }
}
