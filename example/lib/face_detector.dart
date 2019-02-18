/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'package:flutter_android/android_graphics.dart' show Bitmap;
import 'package:flutter_face_detection/flutter_face_detection.dart';

////////////////////////////////////////////////////////////////////////////////

class FaceDetectorDemo extends StatefulWidget {
  @override
  State<FaceDetectorDemo> createState() => _FaceDetectorState();
}

////////////////////////////////////////////////////////////////////////////////

class _FaceDetectorState extends State<FaceDetectorDemo> {
  static const photo = AssetImage('images/einstein.png');

  final Image _image = Image(image: photo);
  FaceDetector _detector;
  List<Face> _faces = <Face>[];

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Face Detector"),
      ),
      body: Center(
        child: CustomPaint(
          child: _image,
          foregroundPainter: FacePainter(
            faces: _faces,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Future<void> _initPlatformState() async {
    _detector = FaceDetector(width: 280, height: 396, maxFaces: 1);
    final faces = await _detector.findFaces(Bitmap.fromAssetImage(photo));
    setState(() {
      _faces = faces;
    });
  }
}
