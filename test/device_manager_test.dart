import 'package:device_manager/device_manager.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('device_manager');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 0;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getDevicesCount', () async {
    expect(await DeviceManager().devicesCount, 0);
  });
}
