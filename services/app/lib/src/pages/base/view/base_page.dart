import 'package:flutter/material.dart';

import '../../pages.dart';
import '../base.dart';

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
    TabData(
      icon: Icons.list_alt,
      title: 'Recepten',
      widget: RecipeIndexPage(),
    ),
    TabData(
      icon: Icons.date_range,
      title: 'Planning',
      widget: SizedBox(),
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
