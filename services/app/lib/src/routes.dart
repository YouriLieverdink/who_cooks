import 'package:app/src/pages/pages.dart';
import 'package:app/src/utilities/utilities.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) {
  switch (settings.name) {
    case '/':
      return withFadeTransition(const BasePage());

    case '/recipes/show':
      final id = settings.arguments as String?;

      return MaterialPageRoute(
        builder: (_) => RecipeShowPage(id: id!),
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
