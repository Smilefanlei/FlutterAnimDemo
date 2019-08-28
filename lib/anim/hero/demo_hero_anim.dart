import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
//    timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Hero Animation'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          ItemView(myData[0], 150),
          ItemView(myData[1], 150),
          ItemView(myData[2], 150),
          ItemView(myData[3], 150),
          ItemView(myData[4], 150),
          ItemView(myData[5], 150),
          ItemView(myData[6], 150),
          ItemView(myData[7], 150),
          ItemView(myData[8], 150),
          ItemView(myData[9], 150),
        ],
      ),
    );
  }
}

Widget getHeroAnim2(ItemModel itemModel) {
  return Scaffold(
    appBar: AppBar(
      title: Text("共享元素"),
      centerTitle: true,
    ),
    body: Container(
      alignment: Alignment.topLeft,
      child: ItemView(itemModel, 400),
    ),
  );
}

List<ItemModel> myData = <ItemModel>[
  ItemModel(
      title: '啦啦啦1111',
      imgUrl:
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2717595227,1512397782&fm=26&gp=0.jpg'),
  ItemModel(
      title: '啦啦啦2222',
      imgUrl:
          'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3454574876,1377139334&fm=26&gp=0.jpg'),
  ItemModel(
      title: '啦啦啦3333',
      imgUrl:
          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1499844476,2082399552&fm=26&gp=0.jpg'),
  ItemModel(
      title: '啦啦啦4444',
      imgUrl:
          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1938482571,2420691429&fm=26&gp=0.jpg'),
  ItemModel(
      title: '啦啦啦5555',
      imgUrl:
          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3548575507,3156953806&fm=26&gp=0.jpg'),
  ItemModel(
      title: '啦啦啦6666',
      imgUrl:
          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3484495061,2102329231&fm=26&gp=0.jpg'),
  ItemModel(
      title: '啦啦啦7777',
      imgUrl:
          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3562330430,950864085&fm=26&gp=0.jpg'),
  ItemModel(
      title: '啦啦啦8888',
      imgUrl:
          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2985783351,2052499916&fm=26&gp=0.jpg'),
  ItemModel(
      title: '啦啦啦9999',
      imgUrl:
          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=311914474,2668302507&fm=26&gp=0.jpg'),
  ItemModel(
      title: '啦啦啦0000',
      imgUrl:
          'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2471845590,913308006&fm=26&gp=0.jpg'),
];

// 数据类型
class ItemModel {
  String title;
  String imgUrl;

  ItemModel({this.title, this.imgUrl});
}

class ItemView extends StatelessWidget {
  ItemModel model;

  double height;

  ItemView(this.model, this.height);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return getHeroAnim2(model);
            },
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: height,
          height: height,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Colors.white),
            child: Hero(
              // 一个viewTree下面不能有相同的
              tag: model.imgUrl,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: Image.network(
                      model.imgUrl,
                      fit: BoxFit.cover,
                    )),
                    Text(model.title),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
