import 'package:dotenv/dotenv.dart';

final _env = DotEnv(includePlatformEnvironment: true) //
  ..load([]);

String get prefix => _env['PREFIX'] ?? '';
String get uriString => _env['MONGODB_URI'] ?? '';
String get version => _env['VERSION'] ?? '';
