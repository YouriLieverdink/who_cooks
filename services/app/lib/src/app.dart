import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './state/state.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We provide all blocs above MaterialApp so they are available everywhere.
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RecipeBloc(),
        ),
      ],
      child: const MaterialApp(),
    );
  }
}
