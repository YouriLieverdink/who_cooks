import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../state/state.dart';
import '../recipes_index.dart';

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
        title: const Text('Recepten'),
        centerTitle: false,
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is RecipeLoaded) {
            if (state.recipes.isEmpty) {
              return const Center(
                child: Text('Nog geen recepten'),
              );
            }

            return RecipeList(recipes: state.recipes);
          }

          // TODO: Display a better error message to the user.
          if (state is RecipeNotLoaded) {
            return Center(
              child: Text(state.error.message),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
