import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudo_challenge/pages/home/home_events.dart';

import 'home_bloc.dart';

class HomeController {

  Future onNavigatorTap(BuildContext context, int index) async {
    print('navigator tap: $index');
    final bloc = BlocProvider.of<HomePageBloc>(context);
    late final HomePageEvent event;
    switch (index) {
      case 0:
        {
          event = ShowUsersEvent();
          break;
        }
      case 1:
        {
          event = ShowPostsEvent();
          break;
        }
    }
    print("adding event: $event");
    bloc.add(event);
  }

}
