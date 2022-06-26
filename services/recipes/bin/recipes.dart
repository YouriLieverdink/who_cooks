import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';

void main() async {
  //
  await $.allReady();
  await shelfRun(handler, defaultBindAddress: '0.0.0.0');
}
