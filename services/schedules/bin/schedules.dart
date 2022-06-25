import 'dart:io';

import 'package:schedules/schedules.dart';
import 'package:shelf_plus/shelf_plus.dart';

void main() async {
  //
  final handler = () => init(prefix);
  final context = await shelfRun(handler, defaultBindAddress: '0.0.0.0');

  // Ensures a gracefull shutdown.
  ProcessSignal.sigint.watch().listen((_) async {
    await context.close();
    await $.reset();

    exit(0);
  });
}
