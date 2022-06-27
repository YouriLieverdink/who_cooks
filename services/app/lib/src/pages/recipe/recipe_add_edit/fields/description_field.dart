import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../recipe_add_edit.dart';

class DescriptionField extends StatelessWidget {
  ///
  static final translations = $.get<Translations>();

  const DescriptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeAddEditCubit, RecipeAddEditState>(
      buildWhen: (previous, current) {
        return previous.description != current.description;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.description,
          onChanged: context.read<RecipeAddEditCubit>().setDescription,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            label: Text(translations.messages.labels.description),
            border: const OutlineInputBorder(),
            alignLabelWithHint: true,
          ),
          minLines: 3,
          maxLines: 5,
        );
      },
    );
  }
}
