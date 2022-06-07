import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';

void main() => shelfRun(init, defaultBindAddress: '0.0.0.0');

Handler init() {
  //
  return RouterPlus() //
    ..mount('/_internal_', InternalController.router)
    ..mount('/recipes', RecipeController.router);
}
