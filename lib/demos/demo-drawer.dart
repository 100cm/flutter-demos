import 'package:dart/components/common/button.component.dart';
import 'package:dart/css/button.css.dart';
import 'package:flutter/material.dart';

class DemoDrawer extends State<DemoDrawerState> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Drawer'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        drawer: new Drawer(
          child: new Center(
            child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[],
            ),
          ),
        ),
        body: Container(
          color: HexColor('#FFFFFF'),
          padding: EdgeInsets.all(20),
          child: Center(
            child: Button(
              'open drawer',
              width: 180.0,
              height: 70.0,
              onClick: () {
                _scaffoldKey.currentState.openDrawer();
              },
              paddingTop: 10.0,
              paddingBottom: 10.0,
              paddingLeft: 10.0,
              paddingRight: 10.0,
              backgroundColor: "#1890ff",
              color: '#FFFFFF',
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () { },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          elevation: 2.0,
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Home",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Home",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class DemoDrawerState extends StatefulWidget {
  const DemoDrawerState();

  @override
  DemoDrawer createState() {
    // TODO: implement createState
    return DemoDrawer();
  }
}
