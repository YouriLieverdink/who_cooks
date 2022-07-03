import 'package:app/src/pages/recipe/recipe_add_edit/recipe_add_edit.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoUrlField extends StatelessWidget {
  const PhotoUrlField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();

    return BlocBuilder<RecipeAddEditCubit, RecipeAddEditState>(
      buildWhen: (previous, current) {
        return previous.photoUrl != current.photoUrl;
      },
      builder: (context, state) {
        return BaseField(
          label: translations.messages.labels.photoUrl,
          value: state.photoUrl,
          onChanged: (value) {
            //
            context.read<RecipeAddEditCubit>().setPhotoUrl(value);
          },
        );
      },
    );
  }
}
