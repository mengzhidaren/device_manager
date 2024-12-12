import 'dart:ui';

enum EventType {
  add,
  remove,
}

class DeviceEvent {
  final int _deviceType;
  final EventType _eventType;

  DeviceEvent(this._deviceType, this._eventType);

  EventType get eventType => _eventType;
  int get deviceType => _deviceType;

  @override
  bool operator ==(Object other) =>
      other is DeviceEvent &&
      other.eventType == eventType &&
      other.deviceType == deviceType;

  @override
  int get hashCode => deviceType*100+eventType.index;

  @override
  String toString() {
    return 'DeviceEvent{_deviceType: $_deviceType, _eventType: $_eventType}';
  }

// @override
  // int get hashCode {
  //   return eventType.index+ deviceType.hashCode;
  // }

}
