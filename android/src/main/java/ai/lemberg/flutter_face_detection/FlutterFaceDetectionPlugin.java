/* This is free and unencumbered software released into the public domain. */

package ai.lemberg.flutter_face_detection;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterFaceDetectionPlugin */
public class FlutterFaceDetectionPlugin {

  /** Plugin registration. */
  public static void registerWith(final Registrar registrar) {
    assert(registrar != null);

    (new MethodChannel(registrar.messenger(), FaceDetectorHandler.CHANNEL))
      .setMethodCallHandler(new FaceDetectorHandler(registrar));
  }
}
