import 'package:schedules/schedules.dart';

class ScheduleDao extends NlIruoyWhocooksSchedulesV0ModelsScheduleDao {
  ScheduleDao() : super(connect: $.getAsync);
}
