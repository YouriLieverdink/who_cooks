import 'package:shelf_plus/shelf_plus.dart';
import '../controllers/controllers.dart';

Handler init(String prefix) {
  //
  final router = RouterPlus();

  router.use(setContentType('application/json'));
  router.use((h) => (r) => h(r.change(path: prefix)));

  router.get('/_internal_/healthcheck', HealthcheckController.get);
  router.get('/recipes', RecipeController.get);
  router.post('/recipes', RecipeController.post);
  router.get('/recipes/<id>', RecipeController.getById);
  router.put('/recipes/<id>', RecipeController.putById);
  router.delete('/recipes/<id>', RecipeController.deleteById);

  return router;
}
