import 'package:app/config/constants.dart';
import 'package:app/src/generated/generated.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/utilities/utilities.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleList extends StatelessWidget {
  const ScheduleList({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  final Schedule schedule;

  /// The [Recipe] which needs to be displayed at the provided [index].
  ///
  /// Returns `null` when no recipe is present for that day.
  Recipe? _recipe(Schedule schedule, int index) {
    //
    final _index = schedule.days[index] //
        ? schedule.days.sublist(0, index).fold<int>(0, (p, c) => c ? p + 1 : p)
        : null;

    return _index == null //
        ? null
        : Recipe.fromJson(schedule.recipes[_index].toJson());
  }

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();

    return ListView.builder(
      padding: const EdgeInsets.only(
        bottom: kPadding * 2.5,
      ),
      itemCount: 7,
      itemBuilder: (context, index) {
        //
        final weekday = weekdays(translations)[index];
        final recipe = _recipe(schedule, index);

        return Column(
          children: [
            ListTile(
              title: Text(weekday),
              minVerticalPadding: 0.0,
              dense: true,
            ),
            if (recipe != null)
              RecipeTile(
                recipe: recipe,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/recipes/show',
                    arguments: recipe.id,
                  );
                },
              )
            else
              const EmptyTile(),
          ],
        );
      },
    );
  }
}
