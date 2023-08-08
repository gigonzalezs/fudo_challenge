import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudo_challenge/pages/home/home_events.dart';

import 'home_bloc.dart';

class HomeController {

  final events = {
    0: () => ShowUsersEvent(),
    1: () => ShowPostsEvent()
  };

  Future onNavigatorTap(BuildContext context, int index) async {
    print('navigator tap: $index');
    final bloc = BlocProvider.of<HomePageBloc>(context);
    final HomePageEvent event = events[index]!();
    print("adding event: $event");
    bloc.add(event);
  }

}
