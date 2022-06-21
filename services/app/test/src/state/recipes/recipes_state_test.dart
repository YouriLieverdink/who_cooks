import 'package:app/src/generated/generated.dart';
import 'package:app/src/state/recipes/recipes_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const error = NlIruoyCommonModelsError(code: '', message: '');

  group('RecipesState', () {
    group('RecipesInitial', () {
      test('supports equality comparisons', () {
        expect(
          const RecipesInitial(),
          equals(const RecipesInitial()),
        );
      });
    });

    group('RecipesLoading', () {
      test('supports equality comparisons', () {
        expect(
          const RecipesLoading(),
          equals(const RecipesLoading()),
        );
      });
    });

    group('RecipesLoaded', () {
      test('supports equality comparisons', () {
        expect(
          const RecipesLoaded(recipes: []),
          equals(const RecipesLoaded(recipes: [])),
        );
      });
    });

    group('RecipesNotLoaded', () {
      test('supports equality comparisons', () {
        expect(
          const RecipesNotLoaded(error: error),
          equals(const RecipesNotLoaded(error: error)),
        );
      });
    });
  });
}
