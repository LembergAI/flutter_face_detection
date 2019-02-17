#import "FlutterFaceDetectionPlugin.h"
#import <flutter_face_detection/flutter_face_detection-Swift.h>

@implementation FlutterFaceDetectionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterFaceDetectionPlugin registerWithRegistrar:registrar];
}
@end
