import 'package:dart/components/common/button.component.dart';
import 'package:flutter/material.dart';

class MyNotification extends Notification {
  MyNotification(this.message);
  final String message;
}

class DemoNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Notification'),),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          showDialog(context: context,builder: (context){
            return AlertDialog(
              content: Text('i received your message ${notification.message }'),
            );
          });
        },
        child: Center(
          child: Builder(builder: (context){
            return Button('send message!',paddingTop: 10.0,paddingBottom: 10.0,
              paddingLeft: 10.0,
              paddingRight: 10.0,
              color: '#FFFFFF',backgroundColor: "##1890ff",onClick:(){
              MyNotification("Hello").dispatch(context);
            } ,);
          }),
        ),
      ),
    );
  }
}
