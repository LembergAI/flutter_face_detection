Flutter Face Detection
======================

[![Project license](https://img.shields.io/badge/license-Public%20Domain-blue.svg)](https://unlicense.org)
[![Pub package](https://img.shields.io/pub/v/flutter_face_detection.svg)](https://pub.dartlang.org/packages/flutter_face_detection)
[![Dartdoc reference](https://img.shields.io/badge/dartdoc-reference-blue.svg)](https://pub.dartlang.org/documentation/flutter_face_detection/latest/)
[![Travis CI build status](https://img.shields.io/travis/LembergAI/flutter_face_detection/master.svg)](https://travis-ci.org/LembergAI/flutter_face_detection)

Real-time, on-device, offline face & eye detection for Flutter apps.

Screenshot
----------

![Screenshot](https://raw.githubusercontent.com/LembergAI/flutter_face_detection/master/example/flutter_01.png)

Features
--------

- Finds face mid-points, eye positions, and face poses in images.

Compatibility
-------------

Android only, at present. (iOS support is planned.)

Examples
--------

### Detecting faces in a static image

```dart
import 'package:flutter_face_detection/flutter_face_detection.dart';

var photo = Image.asset("images/einstein.png");

var bitmap = Bitmap.fromAssetImage(photo.image as AssetImage);
var detector = FaceDetector(width: 280, height: 396);

for (var face in await detector.findFaces(bitmap)) {
  print("Found a face at (${face.midPoint.x}, ${face.midPoint.y}) with confidence ${face.confidence}");
}
```

Caveats
-------

- **At present, iOS is not supported.**
  This will be addressed in a future major release.
