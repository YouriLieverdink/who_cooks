import 'package:dotenv/dotenv.dart';

final _env = DotEnv() //
  ..load();

String get uriString => _env['MONGODB_URI'] ?? '';
