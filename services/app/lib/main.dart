import 'package:flutter/material.dart';

import './src/app.dart';
import './config/config.dart';

void main() {
  // Ensures all services are registered.
  services();

  runApp(const App());
}
