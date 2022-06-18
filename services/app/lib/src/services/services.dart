import 'package:get_it/get_it.dart';

import './repository/repository.dart';

export './repository/repository.dart';

final $ = GetIt.instance;

void services() {
  $.registerSingleton(Repository.instance);
}
