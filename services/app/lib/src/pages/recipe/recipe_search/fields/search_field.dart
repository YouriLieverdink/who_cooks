import 'package:app/src/pages/recipe/recipe_search/recipe_search.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseField(
      hasBorders: false,
      hasAutofocus: true,
      icon: Icons.search,
      onChanged: (value) {
        context //
            .read<RecipeSearchBloc>()
            .add(SearchRecipes(title: value));
      },
    );
  }
}
