import 'package:flutter/material.dart';

class NeoApp extends StatelessWidget {
  final String? title;
  final Widget child;
  const NeoApp({
    this.title,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title ?? "",
      home: Scaffold(
        body: child,
      ),
    );
  }
}
