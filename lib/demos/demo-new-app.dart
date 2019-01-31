import 'package:dart/stores/base_store.dart';
import 'package:flutter/material.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'asdasd',
      routes: {
        '/': (context) => DemoHomeApp(),
      },
    );
  }
}

class DemoHomeApp extends StatelessWidget {

  tapNav(context, int index) {
    Navigator.pushNamed(store.getStore(Stores.MAIN_CONTEXT), '/drawer');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('new App'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          this.tapNav(context, index);
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
          )
        ],
      ),
    );
  }
}
