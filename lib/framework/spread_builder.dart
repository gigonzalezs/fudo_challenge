
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/framework/spread_state.dart';

class Spread<T> extends StatefulWidget {
  final String? stateName;
  final Widget Function(BuildContext, T?) builder;
  late bool isTyped;
  late String typeName;

  Spread({super.key, this.stateName, required this.builder}) {
    if (T == dynamic) {
      isTyped = false;
      typeName = "dynamic";
      if (stateName == null) {
        throw 'stateName must be specified for non typed Spread';
      }
    } else {
      isTyped = true;
      typeName = 'type:${T.toString()}';
    }
  }

  @override
  State<Spread<T>> createState() =>_SpreadState<T>();

}

class _SpreadState<T> extends State<Spread<T>> {
  T? currentState;
  Subscription? subscription;
  @override
  Widget build(BuildContext context) {
    return widget.builder(context, currentState ?? _lastState);
  }

  T? get _lastState {
    late T? state;
    if (widget.isTyped) {
      state = SpreadState().get(widget.typeName);
    } else {
      state = SpreadState().get(widget.stateName!);
    }
    return state;
  }

  void _updateState(dynamic state) {
    setState(() {
      currentState = state;
    });
  }

  void _onSubscriptionCreated(Subscription subscription) {
    this.subscription = subscription;
  }

  @override
  void initState() {
    super.initState();
     if (widget.isTyped) {
        SpreadState().subscribe<T>(_updateState)
            .then(_onSubscriptionCreated);
     } else {
        SpreadState().subscribeNamed(widget.stateName!, _updateState)
        .then(_onSubscriptionCreated);
      }
  }

  @override
  void dispose() {
    subscription?.unSubscribe();
    super.dispose();
  }
}