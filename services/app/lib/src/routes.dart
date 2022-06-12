import 'package:flutter/material.dart';

import './pages/pages.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) {
  //
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => const RecipeIndexPage(),
      );

    case '/recipes/add-edit':
      return MaterialPageRoute(
        builder: (_) => RecipeAddEditPage(id: settings.arguments as String?),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const SizedBox(),
      );
  }
}
