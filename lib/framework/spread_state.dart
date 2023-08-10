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

  void emitKey(String stateKey, dynamic state) async {
    if (!_root.containsKey(stateKey)) {
      _root.putIfAbsent(stateKey, () => state);
    } else {
      _root[stateKey] = state;
    }
    _emit(stateKey, state);
  }

  void emit<T>(T state) async {
    final stateKey = 'type:${T.runtimeType.toString()}';
    emitKey(stateKey, state);
  }

  void _emit(String stateKey, dynamic state) async {
    final list = _listeners[stateKey];
    if (list != null) {
      for (var controller in list) {
        _sendState(controller, state);
      }
    }
  }

  void _sendState(StreamController<dynamic> controller, dynamic state) async {
    controller.add(state);
  }

  Future<Subscription> subscribeByKey(String stateKey, void Function(dynamic) onChange) async {
    final list = _listeners[stateKey] ?? [];
    final controller = StreamController<dynamic>();
    controller.stream.listen(onChange);
    list.add(controller);
    _listeners.putIfAbsent(stateKey, () => list);
    return Subscription._internal(stateKey, controller);
  }

  Future<Subscription> subscribeByType<T>(void Function(T) onChange) async {
    final stateKey = 'type:${T.runtimeType.toString()}';
    final list = _listeners[stateKey] ?? [];
    final controller = StreamController<T>();
    controller.stream.listen(onChange);
    list.add(controller);
    _listeners.putIfAbsent(stateKey, () => list);
    return Subscription._internal(stateKey, controller);
  }

  void _unSubscribe(Subscription subscription) async {
    final list = _listeners[subscription._stateKey];
    list?.remove(subscription._controller);
    subscription._controller.done;
  }
}

class Subscription {
  final String _stateKey;
  final StreamController<dynamic> _controller;

  Subscription._internal(String stateKey, StreamController<dynamic> controller)
      : _controller = controller, _stateKey = stateKey;

  void unSubscribe() async {
    SpreadState()._unSubscribe(this);
  }
}