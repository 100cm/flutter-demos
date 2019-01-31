import 'package:dart/css/button.css.dart';
import 'package:flutter/material.dart';

class DemoList extends StatelessWidget {
  const DemoList();

  @override
  Widget build(BuildContext context) {
    List<Widget> infos = [
      Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Text('I am Left'),
          ),
          Expanded(
            flex: 6,
            child: Text('I am Right'),
          )
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Text('I am Left'),
          ),
          Expanded(
            flex: 6,
            child: Text('I am Right'),
          )
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Text('I am Left'),
          ),
          Expanded(
            flex: 6,
            child: Text('I am Right'),
          )
        ],
      ),
    ];
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('Demo List')),
        body: Container(
          child: RefreshIndicator(
              onRefresh: () {
                print('refresh');
              },
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Container(
                    color: HexColor("#FFFFFF"),
                    padding: EdgeInsets.all(10),
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Text('I am Left'),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text('I am Right'),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: HexColor('#E0E0E0E'),
                    height: 1,
                  );
                },
              )),
        ));
  }
}
