import 'package:shelf_plus/shelf_plus.dart';
import '../controllers/controllers.dart';

Handler init({
  String baseUrl = '',
}) {
  //
  final router = RouterPlus();

  router.use(setContentType('application/json'));

  router.get('$baseUrl/_internal_/healthcheck', HealthcheckController.get);
  router.get('$baseUrl/schedules', ScheduleController.get);
  router.post('$baseUrl/schedules', ScheduleController.post);
  router.put('$baseUrl/schedules/<id>', ScheduleController.putById);
  router.delete('$baseUrl/schedules/<id>', ScheduleController.deleteById);

  return router;
}
