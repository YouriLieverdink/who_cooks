import 'package:app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../recipe_search.dart';

class RecipeSearchField extends StatelessWidget {
  const RecipeSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: theme.colorScheme.onPrimary,
        prefixIcon: const Icon(Icons.search),
        hintText: '...',
      ),
      onChanged: (value) {
        //
        context //
            .read<RecipeSearchBloc>()
            .add(SearchRecipes(title: value));
      },
    );
  }
}
