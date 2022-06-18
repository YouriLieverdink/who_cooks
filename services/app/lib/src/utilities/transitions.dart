import 'package:flutter/material.dart';

Route<dynamic> withFadeTransition(
  Widget widget,
) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => widget,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
