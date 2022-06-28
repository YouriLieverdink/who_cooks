import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/services.dart';

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
      body: TabBarView(
        controller: controller,
        children: const [
          SizedBox(),
          SizedBox(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
