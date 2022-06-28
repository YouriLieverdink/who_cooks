import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/services.dart';
import '../../pages.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    Key? key,
  }) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  ///
  static const tabs = [
    RecipeIndexPage(),
    ScheduleIndexPage(),
  ];

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();

    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list_alt),
            label: translations.messages.pages.recipes,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.date_range),
            label: translations.messages.pages.schedule,
          ),
        ],
      ),
    );
  }
}
