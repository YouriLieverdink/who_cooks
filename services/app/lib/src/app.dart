import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './routes.dart';
import './services/services.dart';
import './state/state.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RecipesBloc(repository: $.get()),
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
