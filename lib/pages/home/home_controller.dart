
import 'package:flutter/cupertino.dart';

class HomeController {
  late final BuildContext context;

  Future onNavigatorTap(int index) async {
    print('navigator tap: $index');
  }
}