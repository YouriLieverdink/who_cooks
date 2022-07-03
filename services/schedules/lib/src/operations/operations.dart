import 'package:schedules/schedules.dart';

import './healthcheck/show_healthcheck.dart';
import './recipe/delete_recipe.dart';
import 'recipe/update_recipe.dart';
import './schedule/add_schedule.dart';
import './schedule/edit_schedule.dart';
import './schedule/list_schedules.dart';
import './schedule/remove_schedule.dart';
import './schedule/show_schedule.dart';

final dao = ScheduleDao();

final showHealthcheck = CreateShowHealthcheck();

final deleteRecipe = CreateDeleteRecipe(dao);
final updateRecipe = CreateUpdateRecipe(dao);

final showSchedule = CreateShowSchedule(dao);
final addSchedule = CreateAddSchedule(dao);
final editSchedule = CreateEditSchedule(dao, showSchedule);
final listSchedules = CreateListSchedules(dao);
final removeSchedule = CreateRemoveSchedule(dao, showSchedule);
