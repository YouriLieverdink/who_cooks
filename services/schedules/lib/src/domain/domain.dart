import 'package:schedules/schedules.dart';

class ScheduleDao extends NlIruoyWhocooksScheduleDao {
  ScheduleDao() : super(connect: $.getAsync);
}
