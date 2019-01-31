import 'dart:math';

import 'package:dart/components/common/button.component.dart';
import 'package:flutter/material.dart';

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(
                tag: "button", //唯一标记，前后两个路由页Hero的tag必须相同
                child: Image.asset("assets/images/demo.jpeg"))));
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<Size> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value.height,
                width: animation.value.width,
                child: child);
          },
          child: child),
    );
  }
}

class DemoAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DemoAnimationState();
  }
}

class DemoAnimationState extends State<DemoAnimation>
    with TickerProviderStateMixin {
  Animation<Size> animation;
  Animation<double> rotateAnimation;
  AnimationController controller;
  AnimationController controller2;
  bool animated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    controller2 = new AnimationController(
        duration: const Duration(milliseconds: 180),
        vsync: this,
        upperBound: 90 / 360);
    //使用弹性曲线
    //宽高从0变到300
    animation =
    new Tween(begin: Size(50, 30), end: Size(200, 80)).animate(controller)
      ..addListener(() {
        setState(() {});
      });

    rotateAnimation = new Tween(begin: 0.0, end: 1.0).animate(controller2);
    //启动动画
//    controller.forward();
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GrowTransition(
            child: Button(
              "Click to grow",
              color: "#FFFFFF",
              backgroundColor: '#1890ff',
              onClick: () {
                var tween;
                if (animated) {
                  controller.reverse();
                } else {
                  controller.forward();
                }
                this.animated = !this.animated;
              },
            ),
            animation: animation,
          ),
          Divider(
            height: 16,
            color: Colors.grey,
          ),
          RotationTransition(
            turns: rotateAnimation,
            child: Button("Click to rotate", width: 180.0,
                height: 60.0,
                onClick: () {
                  if (animated) {
                    controller2.reverse();
                  } else {
                    controller2.forward();
                  }
                  this.animated = !this.animated;
                },
                color: "#FFFFFF",
                backgroundColor: '#1890ff'),
          ),
          Divider(
            height: 16,
            color: Colors.grey,
          ),
          Container(
            height: 80,
            child: InkWell(
              child: Hero(
                  tag: "button", child: Image.asset("assets/images/demo.jpeg")),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, animation, animation2) {
                      return FadeTransition(
                        opacity: animation,
                        child: Scaffold(
                          body: HeroAnimationRouteB(),
                        ),
                      );
                    }));
              },
            ),
          ),
          Divider(
            height: 16,
            color: Colors.grey,
          ),
          ExpansionTile(
            title: Text('Expand me'),
            children: <Widget>[
              Button(
                "Click to rotate", width: 180.0, height: 60.0, color: "#FFFFFF",
                backgroundColor: '#1890ff',),
              Button(
                "Click to rotate", width: 180.0, height: 60.0, color: "#FFFFFF",
                backgroundColor: '#1890ff',),
              Button(
                "Click to rotate", width: 180.0, height: 60.0, color: "#FFFFFF",
                backgroundColor: '#1890ff',)
            ],
          )
        ],
      ),
    );
  }
}
