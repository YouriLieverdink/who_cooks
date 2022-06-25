import 'package:get_it/get_it.dart';

import './services/services.dart';

export './services/services.dart';

final $ = GetIt.instance
  ..registerSingleton(Repository.instance)
  ..registerSingleton(Translations.instance);
