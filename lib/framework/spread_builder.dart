
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/framework/spread_state.dart';

class Spread<T> extends StatefulWidget {
  final String? stateKey;
  final Widget Function(BuildContext, T?) builder;
  late bool isTyped;
  late String typeName;

  Spread({super.key, this.stateKey, required this.builder}) {
    if (T == dynamic) {
      isTyped = false;
      typeName = "dynamic";
      if (stateKey == null) {
        throw 'stateKey must be specified for untyped Spread';
      }
    } else {
      isTyped = true;
      typeName = T.toString();
    }
  }

  @override
  State<Spread<T>> createState() =>_SpreadState<T>();

}

class _SpreadState<T> extends State<Spread<T>> {
  T? currentState;
  Subscription? subscription;
  @override
  Widget build(BuildContext context) => widget.builder(context, currentState);

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
        SpreadState().subscribeNamed(widget.stateKey!, _updateState)
        .then(_onSubscriptionCreated);
      }
  }

  @override
  void dispose() {
    subscription?.unSubscribe();
    super.dispose();
  }
}