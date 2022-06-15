enum EventType {
  add,
  remove,
}

class DeviceEvent {
  int? _deviceType;
  EventType? _eventType;

  DeviceEvent(this._deviceType, this._eventType);

  EventType? get eventType => _eventType;

  int? get deviceType => _deviceType;
}