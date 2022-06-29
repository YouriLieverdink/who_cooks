import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/state.dart';
import '../services/services.dart';

class Providers extends StatelessWidget {
  const Providers({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Repository.instance,
        ),
        RepositoryProvider(
          create: (context) => Translations.instance,
        ),
        RepositoryProvider(
          create: (context) => Theme.of(context),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RecipesBloc(
              repository: context.read(),
            )..add(const LoadRecipes()),
            lazy: false,
          ),
          BlocProvider(
            create: (context) => SchedulesBloc(
              repository: context.read(),
            )..add(const LoadSchedules()),
            lazy: false,
          ),
        ],
        child: child,
      ),
    );
  }
}
