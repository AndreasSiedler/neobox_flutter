import 'package:flutter/material.dart';
import '../helpers/helpers.dart';
import '../utils/enums.dart';

class NeoBox extends StatelessWidget {
  // Margin and padding
  final List<double>? margin;
  final List<double>? marginTop;
  final List<double>? marginLeft;
  final List<double>? marginRight;
  final List<double>? marginBottom;
  final List<double>? marginX;
  final List<double>? padding;
  final List<double>? paddingLeft;
  final List<double>? paddingTop;
  final List<double>? paddingRight;
  final List<double>? paddingBottom;

  // Color and background color
  final List<Color>? background;

  // Gradient

  // Layout, width and height
  final List<double>? width;
  final List<double>? height;
  final List<double>? minWidth;
  final List<double>? maxWidth;
  final List<double>? minHeight;
  final List<double>? maxHeight;
  final List<Display>? display;

  // Flexbox
  final List<FlexDirection>? flexDirection;

  // Borders
  final List<double>? borderWidth;
  final List<Color>? borderColor;

  // Others
  final List<Widget> children;

  const NeoBox({
    // Margin and padding
    this.margin,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.marginX,
    this.padding,
    this.paddingLeft,
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,

    // Color and background color#
    this.background,

    // Gradient

    // Layout, width and height
    this.height,
    this.width,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.display,

    // Flexbox
    this.flexDirection,

    // Borders
    this.borderWidth,
    this.borderColor,

    // Others
    required this.children,
    Key? key,
  }) : super(key: key);

  Widget _getBasicBox(BuildContext context) {
    // Margin and padding
    final _neoBoxMargin = margin;
    final _neoBoxMarginLeft = marginTop;
    final _neoBoxMarginRight = marginRight;
    final _neoBoxMarginBottom = marginBottom;
    final _neoBoxMarginX = marginX;
    final _neoBoxPadding = padding;
    final _neoBoxPaddingLeft = paddingTop;
    final _neoBoxPaddingRight = paddingRight;
    final _neoBoxPaddingBottom = paddingBottom;

    // Color and background color
    final _neoBoxBackground = background;

    //Gradient

    // Layout, width and height
    final _neoBoxHeight = height;
    final _neoBoxWidth = width;
    final _neoBoxMinWidth = minWidth;
    final _neoBoxMaxWidth = maxWidth;
    final _neoBoxMinHeight = minHeight;
    final _neoBoxMaxHeight = maxHeight;
    final _neoBoxDisplay = display;

    // Flexbox
    final _neoBoxFlexDirection = flexDirection ?? [FlexDirection.column];

    // Borders
    final _neoBoxBorderWidth = borderWidth;
    final _neoBoxBorderColor = borderColor ?? [Colors.black];

    // Others

    return Container(
      // Decoration
      decoration: BoxDecoration(
        // Border
        border: _neoBoxBorderWidth != null
            ? Border.all(
                color: _neoBoxBorderColor[gtFrScSz(
                  context,
                  _neoBoxBorderColor,
                )],
                width: _neoBoxBorderWidth[gtFrScSz(
                  context,
                  _neoBoxBorderWidth,
                )],
              )
            : null,
        // Background color
        color: _neoBoxBackground?[gtFrScSz(context, _neoBoxBackground)],
      ),

      // Constraints
      constraints: BoxConstraints(
        minWidth: _neoBoxMinWidth?[gtFrScSz(context, _neoBoxMinWidth)] ?? 0.0,
        maxWidth: _neoBoxMaxWidth?[gtFrScSz(context, _neoBoxMaxWidth)] ??
            double.infinity,
        minHeight:
            _neoBoxMinHeight?[gtFrScSz(context, _neoBoxMinHeight)] ?? 0.0,
        maxHeight: _neoBoxMaxHeight?[gtFrScSz(context, _neoBoxMaxHeight)] ??
            double.infinity,
      ),

      // Margin
      margin: _getEdgeInsets(
        all: _neoBoxMargin?[gtFrScSz(context, _neoBoxMargin)],
        left: _neoBoxMarginLeft?[gtFrScSz(context, _neoBoxMarginLeft)],
        right: _neoBoxMarginRight?[gtFrScSz(context, _neoBoxMarginRight)],
        bottom: _neoBoxMarginBottom?[gtFrScSz(context, _neoBoxMarginBottom)],
        x: _neoBoxMarginX?[gtFrScSz(context, _neoBoxMarginX)],
      ),

      // Padding
      padding: _getEdgeInsets(
        all: _neoBoxPadding?[gtFrScSz(context, _neoBoxPadding)],
        left: _neoBoxPaddingLeft?[gtFrScSz(context, _neoBoxPaddingLeft)],
        right: _neoBoxPaddingRight?[gtFrScSz(context, _neoBoxPaddingRight)],
        bottom: _neoBoxPaddingBottom?[gtFrScSz(context, _neoBoxPaddingBottom)],
      ),

      // Decoration
      height: _neoBoxHeight?[gtFrScSz(context, _neoBoxHeight)],
      width: _neoBoxWidth?[gtFrScSz(context, _neoBoxWidth)],
      child: _neoBoxDisplay?[gtFrScSz(context, _neoBoxDisplay)] == Display.flex
          ? _getChildsBasedOnDirection(
              _neoBoxFlexDirection[gtFrScSz(context, _neoBoxFlexDirection)])
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [...children],
            ),
    );
  }

  _getChildsBasedOnDirection(FlexDirection flexDirection) {
    switch (flexDirection) {
      case FlexDirection.column:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        );
      case FlexDirection.row:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: children,
        );
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final _neoBoxDisplay = display;

    // Display is none
    if (_neoBoxDisplay?[gtFrScSz(context, _neoBoxDisplay)] == Display.none) {
      return Container();
    }

    return _getBasicBox(context);
  }
}

_getEdgeInsets({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
  double? x,
}) {
  final double leftFinal = left ?? x ?? all ?? 0;
  final double topFinal = top ?? all ?? 0;
  final double rightFinal = right ?? x ?? all ?? 0;
  final double bottomFinal = bottom ?? all ?? 0;

  return EdgeInsets.fromLTRB(leftFinal, topFinal, rightFinal, bottomFinal);
}
