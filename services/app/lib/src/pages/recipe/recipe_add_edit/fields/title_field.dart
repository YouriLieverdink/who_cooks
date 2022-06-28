import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/services.dart';
import '../recipe_add_edit.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    Key? key,
  }) : super(key: key);

  String? _error(
    TitleInputError? error, {
    required Translations translations,
  }) {
    switch (error) {
      case TitleInputError.empty:
        return translations.messages.validation.empty(
          translations.messages.labels.title.toLowerCase(),
        );

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();

    return BlocBuilder<RecipeAddEditCubit, RecipeAddEditState>(
      buildWhen: (previous, current) {
        return previous.title != current.title;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title.value,
          onChanged: context.read<RecipeAddEditCubit>().setTitle,
          decoration: InputDecoration(
            label: Text(translations.messages.labels.title),
            border: const OutlineInputBorder(),
            errorText: state.title.pure //
                ? null
                : _error(state.title.error, translations: translations),
          ),
        );
      },
    );
  }
}
