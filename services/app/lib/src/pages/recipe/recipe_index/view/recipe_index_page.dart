import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../state/state.dart';
import '../recipe_index.dart';

class RecipeIndexPage extends StatefulWidget {
  const RecipeIndexPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipeIndexPage> createState() => _RecipeIndexPageState();
}

class _RecipeIndexPageState extends State<RecipeIndexPage> {
  @override
  void initState() {
    super.initState();

    context.read<RecipesBloc>().add(const LoadRecipes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recepten'),
        centerTitle: false,
      ),
      body: BlocBuilder<RecipesBloc, RecipesState>(
        builder: (context, state) {
          if (state is RecipesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RecipesNotLoaded) {
            return const Center(
              child: Text('Er is een fout opgetreden'),
            );
          }

          if (state is RecipesLoaded) {
            return RecipeList(recipes: state.recipes);
          }

          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
