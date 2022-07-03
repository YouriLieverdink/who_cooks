import 'package:schedules/schedules.dart';
import 'package:schedules/src/operations/healthcheck/show_healthcheck.dart';
import 'package:schedules/src/operations/recipe/delete_recipe.dart';
import 'package:schedules/src/operations/recipe/update_recipe.dart';
import 'package:schedules/src/operations/schedule/add_schedule.dart';
import 'package:schedules/src/operations/schedule/edit_schedule.dart';
import 'package:schedules/src/operations/schedule/list_schedules.dart';
import 'package:schedules/src/operations/schedule/remove_schedule.dart';
import 'package:schedules/src/operations/schedule/show_schedule.dart';

final dao = ScheduleDao();

const showHealthcheck = CreateShowHealthcheck();

final deleteRecipe = CreateDeleteRecipe(dao);
final updateRecipe = CreateUpdateRecipe(dao);

final showSchedule = CreateShowSchedule(dao);
final addSchedule = CreateAddSchedule(dao);
final editSchedule = CreateEditSchedule(dao, showSchedule);
final listSchedules = CreateListSchedules(dao);
final removeSchedule = CreateRemoveSchedule(dao, showSchedule);
