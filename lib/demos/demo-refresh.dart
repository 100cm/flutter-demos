import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class DemoRefresh extends StatelessWidget {

  var stream = BehaviorSubject(seedValue: 'n');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification note) {
        print(note.metrics.extentBefore);
        if (note is ScrollEndNotification && note.metrics.extentBefore <= 0) {
          stream.add('after refresh');
        }
      },
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (note) {},
        child: SingleChildScrollView(
          child:
          Container(
            height: 3000,
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                StreamBuilder(
                  stream: stream,
                  builder: (context,snap){
                    return Text(snap.data.toString());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
