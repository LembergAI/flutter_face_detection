/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'face_detector.dart' show FaceDetectorDemo;
import 'package:flutter_face_detection/flutter_face_detection.dart' show SDK;

////////////////////////////////////////////////////////////////////////////////

void main() async {
  final sdkVersion = await SDK.getVersion();
  print("Lemberg.AI SDK $sdkVersion");
  runApp(App());
}

////////////////////////////////////////////////////////////////////////////////

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

////////////////////////////////////////////////////////////////////////////////

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      color: Colors.grey,
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: FaceDetectorDemo(),
      routes: <String, WidgetBuilder>{},
    );
  }
}
