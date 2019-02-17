/* This is free and unencumbered software released into the public domain. */
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterFaceDetection {
  static const MethodChannel _channel =
      const MethodChannel('flutter_face_detection');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
