import 'package:rxdart/rxdart.dart';

class Events {
  static const String Login = 'login';
  static const String Logout = 'logout';
}

//global event monitor
class EventMonitor {
  //singleton class
  EventMonitor._internal();

  static EventMonitor _singleton = new EventMonitor._internal();

  factory EventMonitor() => _singleton;

  var _emap = {Events.Login: BehaviorSubject()};

  void emit(String eventName, [args]) {
    this._emap[eventName].add(args);
  }

  Stream getEvent(name) {
    return this._emap[name];
  }
}

var eventMonitor = new EventMonitor();
