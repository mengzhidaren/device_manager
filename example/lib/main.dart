import 'dart:async';

import 'package:device_manager/device_event.dart';
import 'package:device_manager/device_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  int _devicesCount = -1;

  @override
  void initState() {
    super.initState();
    initDevicesCount();

    DeviceManager().addListener(() {
      var event = DeviceManager().lastEvent;
      if (event != null) {
        if (event.eventType == EventType.add) {
          scaffoldKey.currentState!.showSnackBar(
              const SnackBar(content: Text('New device detected!')));
        } else if (event.eventType == EventType.remove) {
          scaffoldKey.currentState!
              .showSnackBar(const SnackBar(content: Text('Device removed!')));
        }
         print('event=$event');
        //Refresh count
        initDevicesCount();
      }
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initDevicesCount() async {
    int devicesCount;
    try {
      devicesCount = await DeviceManager().devicesCount ?? -1;
    } on PlatformException {
      devicesCount = -1;
    }

    if (!mounted) return;

    setState(() {
      _devicesCount = devicesCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device manager plugin'),
        ),
        body: Center(
          child: Text('Currently have: $_devicesCount devices.'),
        ),
      ),
    );
  }
}
