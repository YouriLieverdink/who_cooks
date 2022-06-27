import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di.dart';
import '../recipe_add_edit.dart';

class PhotoUrlField extends StatelessWidget {
  ///
  static final translations = $.get<Translations>();

  const PhotoUrlField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeAddEditCubit, RecipeAddEditState>(
      buildWhen: (previous, current) {
        return previous.photoUrl != current.photoUrl;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.photoUrl,
          onChanged: context.read<RecipeAddEditCubit>().setPhotoUrl,
          decoration: InputDecoration(
            label: Text(translations.messages.labels.photoUrl),
            border: const OutlineInputBorder(),
            alignLabelWithHint: true,
          ),
        );
      },
    );
  }
}
