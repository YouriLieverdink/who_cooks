import 'package:app/src/pages/schedule/schedule.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/state/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleIndexPage extends StatefulWidget {
  const ScheduleIndexPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScheduleIndexPage> createState() => _ScheduleIndexPageState();
}

class _ScheduleIndexPageState extends State<ScheduleIndexPage>
    with SingleTickerProviderStateMixin {
  ///
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
    context.read<SchedulesBloc>().add(const LoadSchedules());
  }

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translations.messages.pages.schedule,
        ),
        centerTitle: false,
        bottom: TabBar(
          controller: controller,
          onTap: (index) => controller.animateTo(index),
          tabs: [
            Tab(text: translations.messages.hints.thisWeek),
            Tab(text: translations.messages.hints.nextWeek),
          ],
        ),
      ),
      body: BlocBuilder<SchedulesBloc, SchedulesState>(
        builder: (context, state) {
          if (state is SchedulesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SchedulesLoaded) {
            //
            final id = state.schedules.first.id;

            return TabBarView(
              controller: controller,
              children: [
                ScheduleShowPage(id: id),
                const SizedBox(),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
