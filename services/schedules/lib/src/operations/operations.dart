import 'package:schedules/schedules.dart';

export './healthcheck/show_healthcheck.dart';
export './recipe/delete_recipe.dart';
export './recipe/update_recipe.dart';
export './schedule/add_schedule.dart';
export './schedule/edit_schedule.dart';
export './schedule/list_schedules.dart';
export './schedule/remove_schedule.dart';
export './schedule/show_schedule.dart';

final dao = ScheduleDao();

final showHealthcheck = CreateShowHealthcheck($.getAsync, $.getAsync);

final deleteRecipe = CreateDeleteRecipe(dao);
final updateRecipe = CreateUpdateRecipe(dao);

final showSchedule = CreateShowSchedule(dao);
final addSchedule = CreateAddSchedule(dao);
final editSchedule = CreateEditSchedule(dao, showSchedule);
final listSchedules = CreateListSchedules(dao);
final removeSchedule = CreateRemoveSchedule(dao, showSchedule);
