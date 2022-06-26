import 'package:schedules/schedules.dart';
import 'package:shelf_plus/shelf_plus.dart';

Handler handler() {
  //
  final handler = RouterPlus();

  handler.use(setContentType('application/json'));
  handler.use((h) => (r) => h(r.change(path: prefix)));

  return handler
    ..get('/_internal_/healthcheck', HealthcheckController.get)
    ..get('/schedules', ScheduleController.get)
    ..post('/schedules', ScheduleController.post)
    ..put('/schedules/<id>', ScheduleController.putById)
    ..delete('/schedules/<id>', ScheduleController.deleteById);
}
