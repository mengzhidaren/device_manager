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
  bool operator ==(Object o) =>
      o is DeviceEvent &&
      o.eventType == eventType &&
      o.deviceType == deviceType;

  @override
  int get hashCode {
    return hashValues(eventType.hashCode, deviceType.hashCode);
  }
}
