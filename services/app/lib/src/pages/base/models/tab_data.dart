import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TabData extends Equatable {
  const TabData({
    required this.title,
    required this.icon,
    required this.widget,
  });

  final String title;

  final IconData icon;

  final Widget widget;

  @override
  List<Object> get props => [title, icon, widget];
}
