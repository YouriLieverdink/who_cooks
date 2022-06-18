import 'package:flutter/material.dart';

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
  static final translations = $.get<Translations>();

  static final tabs = [
    TabData(
      icon: Icons.list_alt,
      title: translations.messages.pages.recipes,
      widget: const RecipeIndexPage(),
    ),
    TabData(
      icon: Icons.date_range,
      title: translations.messages.pages.schedule,
      widget: const SizedBox(),
    ),
  ];

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          for (var tab in tabs) ...[
            BottomNavigationBarItem(
              icon: Icon(tab.icon),
              label: tab.title,
            ),
          ],
        ],
      ),
    );
  }
}
