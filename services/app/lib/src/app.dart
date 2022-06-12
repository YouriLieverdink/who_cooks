import 'package:app/config/config.dart';
import 'package:flutter/material.dart';

import './routes.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      theme: theme,
    );
  }
}
