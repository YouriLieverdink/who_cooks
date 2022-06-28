import 'package:flutter/material.dart';

import './pages/pages.dart';
import './utilities/utilities.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) {
  switch (settings.name) {
    case '/':
      return withFadeTransition(const BasePage());

    case '/recipes/show':
      final id = settings.arguments as String;

      return MaterialPageRoute(
        builder: (_) => RecipeShowPage(id: id),
      );

    case '/recipes/add-edit':
      final id = settings.arguments as String?;

      return MaterialPageRoute(
        builder: (_) => RecipeAddEditPage(id: id),
      );

    case '/recipes/search':
      return MaterialPageRoute(
        builder: (_) => const RecipeSearchPage(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const SizedBox(),
      );
  }
}
