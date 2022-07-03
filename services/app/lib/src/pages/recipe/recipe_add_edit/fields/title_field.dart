import 'package:app/src/pages/recipe/recipe_add_edit/recipe_add_edit.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    Key? key,
  }) : super(key: key);

  /// Determines the correct error text based on the [TitleInputError].
  String? _error(
    TitleInputError? error,
    Translations translations,
  ) {
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
        //
        final error = state.title.pure //
            ? null
            : state.title.error;

        return BaseField(
          label: translations.messages.labels.title,
          value: state.title.value,
          error: _error(error, translations),
          onChanged: (value) {
            //
            context.read<RecipeAddEditCubit>().setTitle(value);
          },
        );
      },
    );
  }
}
