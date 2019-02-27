/* This is free and unencumbered software released into the public domain. */

package ai.lemberg.flutter_face_detection;

import ai.lemberg.sdk.Sdk;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import java.util.Arrays;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.function.BiConsumer;
import java.util.function.Supplier;

/** FlutterFaceDetectionPlugin */
@SuppressWarnings("unchecked")
public class FlutterFaceDetectionPlugin extends FlutterMethodCallHandler {
  private static final String TAG = "FlutterFaceDetectionPlugin";
  public static final String CHANNEL = "flutter_face_detection";

  private final ExecutorService executor;

  FlutterFaceDetectionPlugin(final Registrar registrar) {
    super(registrar);
    this.executor = Executors.newWorkStealingPool();
  }

  /** Plugin registration. */
  public static void registerWith(final Registrar registrar) {
    assert(registrar != null);

    (new MethodChannel(registrar.messenger(), CHANNEL))
      .setMethodCallHandler(new FlutterFaceDetectionPlugin(registrar));
  }

  static private class ResultCompleter<T> implements BiConsumer<T, Throwable> {
    final Result result;

    ResultCompleter(final Result result) {
      this.result = result;
    }

    @Override
    public void accept(final T value,
                       final Throwable error) {
      if (error != null) {
        this.result.error("Error", error.getMessage(), error.toString());
      }
      else {
        this.result.success(value);
      }
    }
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    assert(call.method != null);
    switch (call.method) {

      case "getVersion": {
        result.success(Sdk.version());
        break;
      }

      case "detectFaces": {
        final Object image = (Object)call.arguments; // TODO
        CompletableFuture
          .supplyAsync(new Supplier() {
            @Override
            public Object get() {
              try {
                return Arrays.asList(); // TODO
              }
              catch (final Exception error) {
                throw new RuntimeException(error);
              }
            }
          }, this.executor)
          .whenComplete(new ResultCompleter<List>(result));
        break;
      }

      default: {
        result.notImplemented();
      }
    }
  }
}
