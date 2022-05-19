import 'package:flutter/material.dart';

import '../helpers/getValueFromScreenSize.dart';
import '../utils/enums.dart';

class NeoFlex extends StatelessWidget {
  final List<Widget> children;
  final List<FlexDirection> flexDirection;

  const NeoFlex({
    required this.children,
    this.flexDirection = const [FlexDirection.column],
    Key? key,
  }) : super(key: key);

  _getChildsBasedOnDirection(FlexDirection flexDirection) {
    switch (flexDirection) {
      case FlexDirection.column:
        return Column(
          children: children.map((widget) => Flexible(child: widget)).toList(),
        );
      case FlexDirection.row:
        return Row(
          children: children.map((widget) => Flexible(child: widget)).toList(),
        );
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final _neoFlexibleFlexDirection = flexDirection;
    return _getChildsBasedOnDirection(_neoFlexibleFlexDirection[
        gtFrScSz(context, _neoFlexibleFlexDirection)]);
  }
}
