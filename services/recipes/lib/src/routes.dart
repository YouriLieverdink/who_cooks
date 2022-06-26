import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';

Handler handler() {
  //
  final handler = RouterPlus();

  handler.use(setContentType('application/json'));
  handler.use((h) => (r) => h(r.change(path: prefix)));

  return handler
    ..get('/_internal_/healthcheck', HealthcheckController.get)
    ..get('/recipes', RecipeController.get)
    ..post('/recipes', RecipeController.post)
    ..get('/recipes/<id>', RecipeController.getById)
    ..put('/recipes/<id>', RecipeController.putById)
    ..delete('/recipes/<id>', RecipeController.deleteById);
}
