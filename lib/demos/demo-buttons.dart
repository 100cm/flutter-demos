import 'package:dart/components/common/button.component.dart';
import 'package:dart/stores/events_monitor.dart';
import 'package:flutter/material.dart';

class DemoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(),
          Button(
            'Button1',
            color: "#FFFFFF",
            backgroundColor: "#ffc82c",
            onClick: (){
              eventMonitor.emit(Events.Login,'click button 1');
            },
            height: 38.0,
            width: 120.0,
          ),
          Divider(),
          Button(
            'Button2',
            color: "#FFFFFF",
            onClick: (){
              eventMonitor.emit(Events.Login,'click button 2');
            },
            backgroundColor: "#ff4949",
            height: 38.0,
            width: 120.0,
          ),
          Divider(),
          Button(
            'Button3',
            color: "#FFFFFF",
            onClick: (){
              eventMonitor.emit(Events.Login,'click button 3');
            },
            backgroundColor: "#1890ff",
            height: 38.0,
            width: 120.0,
          ),
          Divider(),
          Button(
            'Button4',
            borderRadius: 4.0,
            borderWidth: 1.0,
            onClick: (){
              eventMonitor.emit(Events.Login,'click button 4');
            },
            borderStyle: "solid",
            border: "#ff4949",
            color: "#ff4949",
            backgroundColor: "#FFFFF",
            height: 38.0,
            width: 120.0,
          ),
          Divider(),
          Button(
            'Button5',
            borderRadius: 4.0,
            color: "#FFFFFF",
            onClick: (){
              eventMonitor.emit(Events.Login,'click button 5');
            },
            backgroundColor: "#13ce66",
            height: 38.0,
            width: 120.0,
          ),
          Divider(),
          InkWell(
              child: Button(
            'Button',
            borderRadius: 4.0,
            borderWidth: 1.0,
            borderStyle: "solid",
            border: "#6190e8",
            color: "#6190e8",
            backgroundColor: "#FFFFF",
            height: 38.0,
            width: 120.0,
          )),
        ],
      ),
    );
  }
}
