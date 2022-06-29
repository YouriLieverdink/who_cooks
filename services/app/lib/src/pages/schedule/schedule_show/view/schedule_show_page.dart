import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../state/state.dart';
import '../schedule_show.dart';

class Conditional extends StatelessWidget {
  const Conditional(
    this.value, {
    Key? key,
    required this.isTrue,
    this.isFalse,
  }) : super(key: key);

  final bool value;

  final Widget Function(BuildContext) isTrue;

  final Widget Function(BuildContext)? isFalse;

  @override
  Widget build(BuildContext context) {
    return value //
        ? isTrue(context)
        : isFalse != null
            ? isFalse!(context)
            : const SizedBox();
  }
}

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
