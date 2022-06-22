import 'package:schedules/schedules.dart';
import 'package:shelf_plus/shelf_plus.dart';

void main() => shelfRun(() => init(prefix), defaultBindAddress: '0.0.0.0');
