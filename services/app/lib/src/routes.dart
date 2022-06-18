import 'package:flutter/material.dart';

import './pages/pages.dart';
import './utilities/utilities.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) {
  switch (settings.name) {
    case '/':
      return withFadeTransition(const BasePage());

    default:
      return MaterialPageRoute(
        builder: (_) => const SizedBox(),
      );
  }
}
