import 'package:app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({
    Key? key,
    required this.icon,
    required this.message,
  }) : super(key: key);

  final IconData icon;

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeData>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: theme.colorScheme.onSurface,
            size: 32.0,
          ),
          const SizedBox(height: kPadding),
          Text(
            message,
            style: theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
