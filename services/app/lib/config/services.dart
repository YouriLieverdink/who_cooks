import 'package:get_it/get_it.dart';

import '../src/services/services.dart';

export '../src/services/services.dart';

final $ = GetIt.instance;

void services() {
  //
  $.registerSingleton<Client>(
    Client(),
  );
}
