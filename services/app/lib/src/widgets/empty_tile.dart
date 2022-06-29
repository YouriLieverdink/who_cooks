import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants.dart';
import '../services/services.dart';

class EmptyTile extends StatelessWidget {
  const EmptyTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();

    return ListTile(
      enabled: false,
      leading: Container(
        height: 48.0,
        width: 48.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(kRadius),
        ),
        child: Center(
          child: Icon(
            Icons.question_mark,
            color: Colors.grey.shade400,
          ),
        ),
      ),
      title: Text(
        translations.messages.hints.noYet(
          translations.messages.resources.recipe(1),
        ),
      ),
      subtitle: Text(
        translations.messages.hints.addRecipe,
      ),
      isThreeLine: true,
    );
  }
}
