import 'package:schedules/schedules.dart';

import './healthcheck/show_healthcheck.dart';
import './recipe/delete_recipe.dart';
import './recipe/upsert_recipe.dart';
import './schedule/add_schedule.dart';
import './schedule/edit_schedule.dart';
import './schedule/list_schedules.dart';
import './schedule/remove_schedule.dart';
import './schedule/show_schedule.dart';

final dao = NlIruoyWhocooksScheduleDao(connect: $.getAsync);

final showHealthcheck = CreateShowHealthcheck();

final deleteRecipe = CreateDeleteRecipe(dao);
final upsertRecipe = CreateUpsertRecipe(dao);

final showSchedule = CreateShowSchedule(dao);
final addSchedule = CreateAddSchedule(dao);
final editSchedule = CreateEditSchedule(dao, showSchedule);
final listSchedules = CreateListSchedules(dao);
final removeSchedule = CreateRemoveSchedule(dao, showSchedule);
