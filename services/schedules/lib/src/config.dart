import 'package:dotenv/dotenv.dart';

final _env = DotEnv(includePlatformEnvironment: true) //
  ..load([]);

String get dbHost => _env['DB_HOST'] ?? '';
String get queueHost => _env['QUEUE_HOST'] ?? '';

String get version => _env['VERSION'] ?? '';

String get prefix => _env['PREFIX'] ?? '';
