import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DeviceManager with ChangeNotifier {
  static const int deviceInterface = 0x00000005;
  static const int handle = 0x00000006;
  static const int oem = 0x00000000;
  static const int port = 0x00000003;
  static const int volume = 0x00000002;

  static final DeviceManager _singleton = DeviceManager._internal();

  final MethodChannel _channel = const MethodChannel('device_manager');

  factory DeviceManager() {
    return _singleton;
  }

  DeviceManager._internal() {
    _channel.setMethodCallHandler((call) {
      switch (call.method) {
        case "device_added":
          {
            int deviceType = call.arguments;
            if (deviceType == port) {
              notifyListeners();
            }
            break;
          }
        case "device_removed":
          {
            int deviceType = call.arguments;
            if (deviceType == port) {
              notifyListeners();
            }
            break;
          }
      }

      return Future.value(0);
    });
  }

  Future<int?> get devicesCount async {
    final int? count = await _channel.invokeMethod('get_devices_count');
    return count;
  }
}
