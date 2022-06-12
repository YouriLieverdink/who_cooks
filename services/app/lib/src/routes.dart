import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(
  RouteSettings settings,
) {
  switch (settings.name) {
    default:
      return MaterialPageRoute(
        builder: (_) => const SizedBox(),
      );
  }
}
