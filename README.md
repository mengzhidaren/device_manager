# Device Manager for Flutter

`device_manager` is a simple transmitter for the [`WM_DEVICECHANGE`](https://docs.microsoft.com/en-us/windows/win32/devio/wm-devicechange) message.
In other words, your Flutter Win32 App will be notified anytime there is a new hardware device connected to the computer.

Supported platforms:
- Windows

## Usage

To use this package, add `device_manager` as a [dependency in your pubspec.yaml file](https://dart.dev/tools/pub/dependencies).

Now go to `lib\main.dart` and add this code in the `main` function right after `runApp(MyApp());` :

```dart
DeviceManager().addListener(() {
  scaffoldKey.currentState!.showSnackBar(const SnackBar(content: Text('New device detected!')));
});
```

This listener will be called anytime a device had been connected.

You can find examples in the `example` folder.