import 'package:flutter/material.dart';

import '../../../../di.dart';

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
  static final translations = $.get<Translations>();

  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
