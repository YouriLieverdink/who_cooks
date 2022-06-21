import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';

void main() {
  shelfRun(() => init(baseUrl: baseUrl), defaultBindAddress: '0.0.0.0');
}
