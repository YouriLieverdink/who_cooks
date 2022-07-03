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
  late CreateListRecipes listRecipes;

  setUp(() {
    dao = MockRecipeDao();
    listRecipes = CreateListRecipes(dao);

    when(dao.get()) //
        .thenAnswer((_) => Future.value([recipe]));
  });

  group(
    'ListRecipes',
    () {
      test(
        'calls dao.insert with the correct parameters',
        () async {
          await listRecipes();

          verify(dao.get()).called(1);
        },
      );
    },
  );
}
