import 'package:shelf_plus/shelf_plus.dart';
import '../controllers/controllers.dart';

Handler init({
  String baseUrl = '',
}) {
  //
  final router = RouterPlus();

  router.use(setContentType('application/json'));

  router.get('$baseUrl/_internal_/healthcheck', HealthcheckController.get);
  router.get('$baseUrl/recipes', RecipeController.get);
  router.post('$baseUrl/recipes', RecipeController.post);
  router.put('$baseUrl/recipes/<id>', RecipeController.putById);
  router.delete('$baseUrl/recipes/<id>', RecipeController.deleteById);

  return router;
}
