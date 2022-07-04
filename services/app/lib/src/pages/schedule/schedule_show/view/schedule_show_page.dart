import 'package:app/src/pages/schedule/schedule_show/schedule_show.dart';
import 'package:app/src/state/state.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleShowPage extends StatelessWidget {
  const ScheduleShowPage({
    Key? key,
    this.id,
  }) : super(key: key);

  /// The unique identifier of the schedule to display.
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Conditional(
      id != null,
      isTrue: (context) {
        return BlocBuilder<SchedulesBloc, SchedulesState>(
          builder: (context, state) {
            if (state is! SchedulesLoaded) {
              return const SizedBox();
            }

            final schedule = state.schedules //
                .where((v) => v.id == id)
                .firstOrNull;

            if (schedule == null) {
              return const SizedBox();
            }

            return ScheduleList(schedule: schedule);
          },
        );
      },
    );
  }
}
