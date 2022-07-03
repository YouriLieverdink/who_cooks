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
  late Queue queue;
  late CreateAddRecipe addRecipe;

  Future<Queue> connectQueue() => Future.value(queue);

  setUp(() {
    dao = MockRecipeDao();
    queue = MockQueue();
    addRecipe = CreateAddRecipe(dao, connectQueue);

    when(dao.insert(recipeForm)).thenAnswer((_) => Future.value(recipe));
    when(queue.add(anything)).thenAnswer((_) => Future.value());
  });

  group('AddRecipe', () {
    test(
      'calls dao.insert with the correct parameters',
      () async {
        await addRecipe(recipeForm);

        verify(dao.insert(recipeForm)).called(1);
      },
    );

    test(
      'publishes an event when completing normally',
      () async {
        await addRecipe(recipeForm);

        verify(queue.add(anything)).called(1);
      },
    );
  });
}
