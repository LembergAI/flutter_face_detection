/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel;

const MethodChannel _channel = MethodChannel('flutter_face_detection');

abstract class SDK {
  static Future<String> getVersion() async {
    return await _channel.invokeMethod('getVersion');
  }

  static Future<dynamic> detectFaces(final Object image) async {
    return await _channel.invokeMethod('detectFaces');
  }
}
