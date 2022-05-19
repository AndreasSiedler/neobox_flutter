import 'package:flutter/material.dart';

import '../helpers/getValueFromScreenSize.dart';

enum SoATextFontSize { sm, md, lg }
enum SoATextAlignment { left, center }
enum SoATextHeight { sm, md, lg }

class NeoText extends StatelessWidget {
  final String content;
  // Typography
  final List<String>? fontFamily;
  final List<double>? fontSize;
  final List<FontWeight>? fontWeight;
  final List<double>? lineHeight;
  final List<double>? letterSpacing;
  final List<double>? textAlign;
  final List<FontStyle>? fontStyle;
  final List<FontStyle>? textTransform;
  final List<FontStyle>? textDecoration;

  const NeoText(
    this.content, {
    // Typography
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.lineHeight,
    this.letterSpacing,
    this.textAlign,
    this.fontStyle,
    this.textTransform,
    this.textDecoration,
    // Others
    Key? key,
  }) : super(key: key);

  double _getTextFontSize(SoATextFontSize fontSize) {
    switch (fontSize) {
      case SoATextFontSize.sm:
        return 10;
      case SoATextFontSize.md:
        return 15;
      case SoATextFontSize.lg:
        return 20;
      default:
        return 15;
    }
  }

  TextAlign _getTextFontAlignment(SoATextAlignment fontAlignment) {
    switch (fontAlignment) {
      case SoATextAlignment.left:
        return TextAlign.left;
      case SoATextAlignment.center:
        return TextAlign.center;
      default:
        return TextAlign.left;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _neoTextFontSize = fontSize;

    return Text(
      content,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: _neoTextFontSize?[gtFrScSz(context, _neoTextFontSize)],
        color: Colors.black,
      ),
    );
  }
}
