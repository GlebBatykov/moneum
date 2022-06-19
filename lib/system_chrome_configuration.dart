import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemChromeConfiguration {
  Future<void> configure() async {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }
}
