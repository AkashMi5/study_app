import 'package:flutter/services.dart';

setDeviceOrientationPortraitOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
