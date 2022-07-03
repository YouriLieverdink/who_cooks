import 'package:app/src/pages/recipe/recipe_search/recipe_search.dart';
import 'package:app/src/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeSearchPage extends StatelessWidget {
  const RecipeSearchPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translations = context.read<Translations>();

    return BlocProvider(
      create: (_) => RecipeSearchBloc(
        repository: context.read(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(translations.messages.pages.search),
          centerTitle: false,
          bottom: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: kToolbarHeight * 2,
            title: const SearchField(),
          ),
        ),
        body: const RecipeSearchPageBody(),
      ),
    );
  }
}
