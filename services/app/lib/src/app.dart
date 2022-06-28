import 'package:flutter/material.dart';

import './routes.dart';
import './widgets/widgets.dart';

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
