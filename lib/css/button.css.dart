import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    if (hexColor != null) {
      hexColor = hexColor.toUpperCase().replaceAll("#", "");
      if (hexColor.length == 6) {
        hexColor = "FF" + hexColor;
      }
      return int.parse(hexColor, radix: 16);
    } else {
      return 0xffffffff;
    }
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class CssBaseComponent extends StatelessWidget {
  final String backgroundColor;

  final String border;

  final double borderRadius;

  final String boxShadow;

  final String color;

  final String padding;

  final double borderWidth;

  final double fontSize;

  final double fontWeight;

  final String borderStyle;

  final double paddingLeft;

  final double paddingTop;

  final double paddingRight;

  final double paddingBottom;

  final double width;

  final double height;
  final Key key;

  const CssBaseComponent(
      {this.backgroundColor,
      this.border,
      this.key,
      this.borderRadius,
      this.boxShadow,
      this.color,
      this.padding,
      this.borderWidth,
      this.fontSize,
      this.fontWeight,
      this.borderStyle,
      this.paddingLeft,
      this.paddingTop,
      this.paddingRight,
      this.paddingBottom,
      this.width,
      this.fontFamily,
      this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  @override
  final String fontFamily;
}
