// Get right list value from screen size
import 'package:flutter/material.dart';

import '../widgets/neo_screen_size.dart';

int gtFrScSz(
  BuildContext context,
  List<Object> values,
) {
  switch (NeoScreenSize.getScreenSize(context)) {
    case ScreenSize.desktop:
      return values.length <= 3 ? values.length - 1 : 2;
    case ScreenSize.tablet:
      return values.length <= 2 ? values.length - 1 : 1;
    case ScreenSize.mobile:
      return values.length <= 1 ? values.length - 1 : 0;
    default:
      return 0;
  }
}
