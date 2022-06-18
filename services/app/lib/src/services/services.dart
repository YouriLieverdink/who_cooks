import 'package:get_it/get_it.dart';

import './repository/repository.dart';
import './translations/translations.dart';

export './repository/repository.dart';
export './translations/translations.dart';

final $ = GetIt.instance;

void services() {
  $.registerSingleton(Repository.instance);
  $.registerSingleton(Translations.instance);
}
