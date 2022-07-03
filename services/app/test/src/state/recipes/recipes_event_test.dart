import 'package:app/src/state/recipes/recipes_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const skip = 5;
  const limit = 10;

  group(
    'RecipesEvent',
    () {
      group(
        'LoadRecipes',
        () {
          test(
            'supports equality comparisons',
            () {
              expect(
                const LoadRecipes(skip: skip, limit: limit),
                equals(const LoadRecipes(skip: skip, limit: limit)),
              );
            },
          );
        },
      );
    },
  );
}
