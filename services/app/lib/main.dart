import 'package:flutter/material.dart';

import './src/app.dart';
import './src/services/services.dart';

void main() {
  // Ensures all services are properly initialised.
  services();

  runApp(const App());
}
