import 'package:app/src/services/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './di.dart';
import './routes.dart';
import './state/state.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => Repository.instance,
        ),
        RepositoryProvider(
          create: (_) => Translations.instance,
        ),
        RepositoryProvider(
          create: (context) => Theme.of(context),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RecipesBloc(repository: $.get()),
          ),
          BlocProvider(
            create: (_) => SchedulesBloc(repository: $.get()),
          ),
        ],
        child: const MaterialApp(
          title: 'Who cooks?',
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
