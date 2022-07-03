import 'package:mockito/mockito.dart';
import 'package:recipes/recipes.dart';
import 'package:test/test.dart';

import '../operations.mocks.dart';

const id = '62c19a04c6a1b8393595ccfc';

const recipeForm = RecipeForm(
  title: 'Banana bread',
);

const recipe = Recipe(
  id: id,
  title: 'Banana bread',
);

void main() {
  late RecipeDao dao;
  late CreateShowRecipe showRecipe;

  setUp(() {
    dao = MockRecipeDao();
    showRecipe = CreateShowRecipe(dao);

    when(dao.getById(id: id)) //
        .thenAnswer((_) => Future.value(recipe));
  });

  group('ShowRecipe', () {
    test(
      'throws when the recipe was not found',
      () {
        when(dao.getById(id: id)).thenAnswer((_) => Future.value(null));

        expect(
          showRecipe(id: id),
          throwsA(isA<NlIruoyCommonV0ModelsError>()),
        );
      },
    );

    test(
      'does not throw when the recipe was found',
      () {
        expect(
          showRecipe(id: id),
          completes,
        );
      },
    );

    test(
      'calls dao.getById with the correct parameters',
      () async {
        await showRecipe(id: id);

        verify(dao.getById(id: id)).called(1);
      },
    );
  });
}
