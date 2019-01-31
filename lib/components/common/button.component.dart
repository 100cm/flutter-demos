import 'package:dart/css/button.css.dart';
import 'package:flutter/material.dart';

class Button extends CssBaseComponent {
  /// Whether to paint the box decoration behind or in front of the child.
  ///
  final DecorationPosition position;
  final String data;

  final onClick;

  const Button(this.data,
      {color = '#000000',
      Key key,
      borderStyle,
      borderWidth = 0.0,
      borderRadius = 0.0,
      border,
      width,
      height,
      fontSize,
      paddingLeft = 0.0,
      paddingRight = 0.0,
      paddingTop = 0.0,
      paddingBottom = 0.0,
      this.onClick,
      backgroundColor = "#000000",
      this.position = DecorationPosition.background})
      : super(
            color: color,
            border: border,
            key:key,
            borderWidth: borderWidth,
            borderRadius: borderRadius,
            backgroundColor: backgroundColor,
            paddingLeft: paddingLeft,
            paddingTop: paddingTop,
            width: width,
            height: height,
            fontSize: fontSize,
            paddingBottom: paddingBottom,
            paddingRight: paddingRight,
            borderStyle: borderStyle);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onClick,
      child: Container(
          decoration: BoxDecoration(
              color: HexColor(this.backgroundColor),
              border: Border.all(
                style: this.borderStyle == null
                    ? BorderStyle.none
                    : BorderStyle.solid,
                color: HexColor(this.border),
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(this.borderRadius)),
          width: this.width,
          height: this.height,
          child: Padding(
            padding: EdgeInsets.fromLTRB(this.paddingLeft, this.paddingTop,
                this.paddingLeft, this.paddingBottom),
            child: Center(
              child: Text(
                data,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor(color),
                  fontSize: this.fontSize,
                ),
              ),
            ),
          )),
    );
  }
}
