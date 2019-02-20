/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel;

const MethodChannel _channel = MethodChannel('flutter_face_detection/FaceDetector');

abstract class SDK {
  static Future<String> getVersion() async {
    return await _channel.invokeMethod('getVersion');
  }
}
