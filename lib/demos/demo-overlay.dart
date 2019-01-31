import 'package:dart/components/common/button.component.dart';
import 'package:dart/stores/base_store.dart';
import 'package:flutter/material.dart';

class DemoOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DemoOverlayState();
  }
}

class DemoOverlayState extends State<DemoOverlay> {
  var overlay;
  var dropdownOverLay;
  GlobalKey _keyDrop = GlobalKey();
  final LayerLink _layerLink = LayerLink();

  var _dropOpen = false;

  initState() {
    super.initState();
    overlay = OverlayEntry(builder: (context) {
      return AnimationOverlay(closeOverlay);
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = _keyDrop.currentContext.findRenderObject();
    var size = renderBox.size;
    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(0.0, size.height + 5.0),
                  child: Material(
                      elevation: 4.0,
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          ListTile(
                            title: Text('CHOOSE1'),
                          ),
                          ListTile(
                            title: Text('CHOOSE2'),
                          ),
                        ],
                      ))),
            ));
  }

  closeOverlay() {
    this.overlay.remove();
  }

  clickDrop() {
    if (this._dropOpen == false) {
      dropdownOverLay = _createOverlayEntry();
      Overlay.of(context).insert(dropdownOverLay);
    } else {
      dropdownOverLay.remove();
    }
    this._dropOpen = !this._dropOpen;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlay'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Button(
                'Animation Overlay',
                color: "#FFFFFF",
                backgroundColor: '#1890ff',
                height: 50.0,
                onClick: () {
                  Navigator.of(context).overlay.insert(overlay);
                },
              ),
              new DropdownButton<String>(
                hint: Button(
                  'Base DropDown',
                  color: "#000000",
                  backgroundColor: '#FFFFFF',
                ),
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              Divider(),
              CompositedTransformTarget(
                link: _layerLink,
                child: Button(
                  'DropDown Overlay',
                  key: _keyDrop,
                  color: "#FFFFFF",
                  backgroundColor: '#1890ff',
                  height: 50.0,
                  onClick: clickDrop,
                ) ,
              ),
              Container(
                height: 1200,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimationOverlay extends StatefulWidget {
  final cb;

  AnimationOverlay(this.cb);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationOverlayState(cb);
  }
}

class AnimationOverlayState extends State<AnimationOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimation;
  final cb;

  AnimationOverlayState(this.cb);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.4).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    controller.forward();
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: GestureDetector(
            onTap: () async {
              await controller.reverse();
              cb();
            },
            child: Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text("Well hello there!"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
