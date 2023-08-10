
import 'package:flutter/cupertino.dart';
import 'package:fudo_challenge/framework/spread_state.dart';

class Spread extends StatefulWidget {
  final String stateKey;
  final Widget Function(BuildContext, dynamic) builder;

  const Spread({super.key, required this.stateKey, required this.builder});

  @override
  State<Spread> createState() => _SpreadState();

}

class _SpreadState extends State<Spread> {
  dynamic currentState;
  Subscription? subscription;
  @override
  Widget build(BuildContext context) => widget.builder(context, currentState);

  @override
  void initState() {
     SpreadState().subscribe(widget.stateKey, (state) {
      setState(() {
        currentState = state;
      });
    }).then((subscription) => this.subscription = subscription);
  }

  @override
  void dispose() {
    subscription?.unSubscribe();
  }
}