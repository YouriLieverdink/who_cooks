import 'package:schedules/schedules.dart';

import './healthcheck/show_healthcheck.dart';
import './schedule/add_schedule.dart';
import './schedule/edit_schedule.dart';
import './schedule/list_schedules.dart';
import './schedule/show_schedule.dart';
import './schedule/remove_schedule.dart';

// Dependencies.
final dao = NlIruoyWhocooksScheduleDao(connect: $.getAsync);

final showHealthcheck = CreateShowHealthcheck();

final showSchedule = CreateShowSchedule(dao: dao);
final addSchedule = CreateAddSchedule(dao: dao);
final editSchedule = CreateEditSchedule(dao: dao, showSchedule: showSchedule);
final listSchedules = CreateListSchedules(dao: dao);
final removeSchedule =
    CreateRemoveSchedule(dao: dao, showSchedule: showSchedule);
