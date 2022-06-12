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

    // Retrieve the recipes.
    context.read<RecipeBloc>().add(const ListRecipes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      // TODO: Implement all the states of this bloc.
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoaded) {
            //
            return RecipeList(recipes: state.recipes);
          }

          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //
          Navigator.of(context).pushNamed(
            '/recipes/add-edit',
          );
        },
      ),
    );
  }
}
