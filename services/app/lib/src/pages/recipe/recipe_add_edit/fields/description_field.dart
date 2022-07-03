import 'package:app/src/pages/recipe/recipe_add_edit/recipe_add_edit.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();

    return BlocBuilder<RecipeAddEditCubit, RecipeAddEditState>(
      buildWhen: (previous, current) {
        return previous.description != current.description;
      },
      builder: (context, state) {
        return BaseField(
          label: translations.messages.labels.description,
          value: state.description,
          isMultiline: true,
          onChanged: (value) {
            //
            context.read<RecipeAddEditCubit>().setDescription(value);
          },
        );
      },
    );
  }
}
