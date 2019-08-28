import 'package:flutter/material.dart';
import 'package:mryt_flutter_anim_demo/pages/demo_tween_anim_page.dart';
import 'package:mryt_flutter_anim_demo/pages/demo_physical_anim_page.dart';
import 'package:mryt_flutter_anim_demo/pages/demo_third_anim_page.dart';

import 'anim/hero/demo_animlist_page.dart';
import 'anim/hero/demo_drag_page.dart';
import 'anim/hero/demo_hero_anim.dart';
import 'anim/third/demo_flare_anim_page.dart';
import 'anim/third/demo_lottie_anim_page.dart';
import 'anim/tween/demo_animbuild_anim.dart';
import 'anim/tween/demo_animwidget_anim.dart';
import 'anim/tween/demo_combination_anim.dart';
import 'anim/tween/demo_fade_anim.dart';
import 'anim/tween/demo_nonlinear_anim.dart';
import 'anim/tween/demo_rotate_anim.dart';
import 'anim/tween/demo_scale_anim.dart';
import 'anim/tween/demo_transfer_anim.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter动画总结',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter动画总结'),
      routes: <String, WidgetBuilder>{
        '/transferAnim': (BuildContext context) => TransferAnim(), // 位移
        '/rotateAnim': (BuildContext context) => RotateAnim(), // 旋转
        '/scaleAnim': (BuildContext context) => ScaleAnim(), // 缩放
        '/fadeAnim': (BuildContext context) => FadeAnim(), // 渐隐渐现
        '/nonlinearAnim':(BuildContext context) => NonlinearAnim(),// 非线性曲线动画
        '/animWidgetPage':(BuildContext context) => AnimWidgetPage(),// 自定义动画Widget
        '/combinationAnimPage':(BuildContext context) => CombinationAnimPage(),// 组合动画
        '/customAnimBuildPage':(BuildContext context) => CustomAnimBuildPage(),// 自定义
        '/animatedListSample':(BuildContext context) => AnimatedListSample(),// 列表动画
        '/heroAnimation':(BuildContext context) => HeroAnimation(),// 共享元素动画
        '/dragAnimPage':(BuildContext context) => DragAnimPage(),// 拖拽动画
        '/lottieAnimPage':(BuildContext context) => LottieAnimPage(),// 第三方  airbnb  lottie
        '/flareAnimPage':(BuildContext context) => FlareAnimPage(),// 第三方  flare
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomBarSelectIndex = 0;
  int _stackSelectStack = 0;

  // 初始化页面
  List<Widget> _getPages;

  @override
  void initState() {
    super.initState();
    _getPages = [TweenAnimDemo(), Container(), Container()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _stackSelectStack,
        children: _getPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _bottomBarSelectIndex = index;
            selectPageByIndex(index);
          });
        },
        currentIndex: _bottomBarSelectIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.android),
            title: Text('补间动画'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('共享元素动画'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theaters),
            title: Text('第三方动画'),
          ),
        ],
      ),
    );
  }

  // 获取页面
  void selectPageByIndex(int currentIndex) {
    if (currentIndex == 0) {
      if (_stackSelectStack != currentIndex) {
        setState(() {
          if (_getPages[currentIndex] is Container) {
            _getPages.removeAt(currentIndex);
            _getPages.insert(currentIndex, TweenAnimDemo());
          }
          _stackSelectStack = currentIndex;
        });
      }
    } else if (currentIndex == 1) {
      if (_stackSelectStack != currentIndex) {
        setState(() {
          if (_getPages[currentIndex] is Container) {
            _getPages.removeAt(currentIndex);
            _getPages.insert(currentIndex, PhysicalAnimDemo());
          }
          _stackSelectStack = currentIndex;
        });
      }
    } else {
      if (_stackSelectStack != currentIndex) {
        setState(() {
          if (_getPages[currentIndex] is Container) {
            _getPages.removeAt(currentIndex);
            _getPages.insert(currentIndex, ThirdAnimDemo());
          }
          _stackSelectStack = currentIndex;
        });
      }
    }
  }
}
