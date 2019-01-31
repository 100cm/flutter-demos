import 'package:flutter/material.dart';

class DemoGridView extends StatelessWidget {
  const DemoGridView();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('grid view')),
      body: GridView.count(crossAxisCount: 3, children: <Widget>[
        IconButton(icon: Icon(Icons.list)),
        IconButton(icon: Icon(Icons.face)),
        IconButton(icon: Icon(Icons.cached)),
        IconButton(icon: Icon(Icons.cake)),
        IconButton(icon: Icon(Icons.wallpaper)),
        IconButton(icon: Icon(Icons.fast_forward)),
        IconButton(icon: Icon(Icons.list)),
        IconButton(icon: Icon(Icons.face)),
        IconButton(icon: Icon(Icons.cached)),
        IconButton(icon: Icon(Icons.cake)),
        IconButton(icon: Icon(Icons.wallpaper)),
        IconButton(icon: Icon(Icons.fast_forward)),
      ],),
    );
  }
}
