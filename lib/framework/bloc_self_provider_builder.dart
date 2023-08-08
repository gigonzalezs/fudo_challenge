// https://github.com/felangel/bloc/issues/3924 (OPEN)

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSelfProviderBuilder<B extends StateStreamableSource<S>, S> extends StatelessWidget {
  final B bloc;
  final BlocWidgetBuilder<S> builder;

  const BlocSelfProviderBuilder({
    super.key,
    required this.bloc,
    required this.builder
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
        create: (_) => bloc,
        child: _BlocSelfProviderBuilderContent<B, S>(
            builder: builder
        )
    );
  }
}

class _BlocSelfProviderBuilderContent<B extends StateStreamableSource<S>, S> extends StatelessWidget {
  final BlocWidgetBuilder<S> builder;

  const _BlocSelfProviderBuilderContent({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: builder
    );
  }
}
