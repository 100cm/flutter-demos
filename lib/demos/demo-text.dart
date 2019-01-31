import 'package:dart/components/stream/stream-text.component.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class DemoText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DemoTextState();
  }
}

class DemoTextState extends State {
  final stream = BehaviorSubject(seedValue: 'stream text value');
  TextEditingController textController = TextEditingController();
  var controllerText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.addListener((){
      print('text change');
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (v) {
                stream.add(v);
              },
            ),
            StreamText(stream),
            Divider(color: Colors.grey),
            TextField(
              controller: textController,
            ),
            Text(textController.text)
          ],
        ),
      ),
    );
  }
}
