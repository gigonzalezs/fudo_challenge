import 'dart:async';

class SpreadState {

  static final SpreadState _singleton = SpreadState._internal();
  late final Map<String, dynamic> _root;
  late final Map<String, List<StreamController<dynamic>>> _listeners;

  factory SpreadState() {
    return _singleton;
  }

  SpreadState._internal() {
    _root = {};
    _listeners = {};
  }

  T? get<T>(String stateName) {
    return _root[stateName];
  }

  void emit<T>(T state) async {
    final stateName = 'type:${T.toString()}';
    emitNamed(stateName, state);
  }

  void emitNamed(String stateName, dynamic state) async {
    if (!_root.containsKey(stateName)) {
      _root.putIfAbsent(stateName, () => state);
    } else {
      _root[stateName] = state;
    }
    _emit(stateName, state);
  }

  void _emit(String stateName, dynamic state) async {
    final list = _listeners[stateName];
    if (list != null) {
      for (var controller in list) {
        _sendState(controller, state);
      }
    }
  }

  void _sendState(StreamController<dynamic> controller, dynamic state) async {
    controller.add(state);
  }

  Future<Subscription> subscribe<T>(void Function(T) onChange) async {
    final stateName = 'type:${T.toString()}';
    final list = _listeners[stateName] ?? [];
    final controller = StreamController<T>();
    controller.stream.listen(onChange);
    list.add(controller);
    _listeners.putIfAbsent(stateName, () => list);
    return Subscription._internal(stateName, controller);
  }

  Future<Subscription> subscribeNamed(String stateName, void Function(dynamic) onChange) async {
    final list = _listeners[stateName] ?? [];
    final controller = StreamController<dynamic>();
    controller.stream.listen(onChange);
    list.add(controller);
    _listeners.putIfAbsent(stateName, () => list);
    return Subscription._internal(stateName, controller);
  }


  void _unSubscribe(Subscription subscription) async {
    final list = _listeners[subscription._stateName];
    list?.remove(subscription._controller);
    subscription._controller.close();
  }
}

class Subscription {
  final String _stateName;
  final StreamController<dynamic> _controller;

  Subscription._internal(String stateName, StreamController<dynamic> controller)
      : _controller = controller, _stateName = stateName;

  void unSubscribe() async {
    SpreadState()._unSubscribe(this);
  }
}