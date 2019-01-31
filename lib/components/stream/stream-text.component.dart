import 'package:flutter/material.dart';

class StreamText extends StatelessWidget {
  StreamText(
    this.stream, {
    this.style,
  });

  final Stream<dynamic> stream;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: stream,
      builder: (context, snapshot) {
        return Text(snapshot.data.toString(), style: style);
      },
    );
  }
}
