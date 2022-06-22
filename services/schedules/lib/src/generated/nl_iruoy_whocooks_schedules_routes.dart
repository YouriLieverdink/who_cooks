import 'package:shelf_plus/shelf_plus.dart';
import '../controllers/controllers.dart';

Handler init(
  String prefix,
) {
  //
  final router = RouterPlus();

  router.use(setContentType('application/json'));
  router.use((h) => (r) => h(r.change(path: prefix)));

  router.get('/_internal_/healthcheck', HealthcheckController.get);
  router.get('/schedules', ScheduleController.get);
  router.post('/schedules', ScheduleController.post);
  router.put('/schedules/<id>', ScheduleController.putById);
  router.delete('/schedules/<id>', ScheduleController.deleteById);

  return router;
}
