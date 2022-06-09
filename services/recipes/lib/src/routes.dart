import 'package:shelf_plus/shelf_plus.dart';

import './controllers/controllers.dart';

Handler init() {
  //
  final router = RouterPlus();

  router.use(setContentType('application/json'));

  router.get('/_internal_/healthcheck', InternalController.get);
  router.get('/recipes', RecipeController.get);
  router.post('/recipes', RecipeController.post);
  router.put('/recipes/<id>', RecipeController.putById);
  router.delete('/recipes/<id>', RecipeController.deleteById);

  return router;
}
