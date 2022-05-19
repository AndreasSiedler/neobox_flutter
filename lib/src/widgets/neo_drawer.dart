import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class NeoDrawer extends StatelessWidget {
  final GlobalKey<DrawerControllerState> _drawerKey =
      GlobalKey<DrawerControllerState>();
  final drawerScrimColor = const Color.fromARGB(90, 100, 100, 128);
  final double? drawerEdgeDragWidth = null;
  final DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start;

  final Widget body;
  final Drawer drawer;

  NeoDrawer({
    Key? key,
    required this.body,
    required this.drawer,
  }) : super(key: key);

  void openDrawer() {
    _drawerKey.currentState?.open();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          body,
          DrawerController(
            key: _drawerKey,
            alignment: DrawerAlignment.end,
            child: drawer,
            drawerCallback: (_) {},
            dragStartBehavior: drawerDragStartBehavior,
            scrimColor: drawerScrimColor,
            edgeDragWidth: drawerEdgeDragWidth,
          ),
        ],
      );
}
