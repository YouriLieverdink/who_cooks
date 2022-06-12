import 'package:flutter/material.dart';

import './src/app.dart';
import './config/config.dart';

void main() {
  // Ensures all configurations are loaded.
  config();

  runApp(const App());
}
