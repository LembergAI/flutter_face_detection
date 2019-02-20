/* This is free and unencumbered software released into the public domain. */

package ai.lemberg.flutter_face_detection;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FaceDetectorHandler */
class FaceDetectorHandler extends FlutterMethodCallHandler {
  static final String CHANNEL = "flutter_face_detection/FaceDetector";

  FaceDetectorHandler(final Registrar registrar) {
    super(registrar);
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    assert(call.method != null);
    switch (call.method) {
      // TODO

      default: {
        result.notImplemented();
      }
    }
  }
}
