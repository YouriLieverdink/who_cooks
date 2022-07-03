import 'package:app/src/routes.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Providers(
      child: MaterialApp(
        title: 'Who cooks?',
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
