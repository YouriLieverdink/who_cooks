import 'package:mockito/mockito.dart';
import 'package:recipes/recipes.dart';
import 'package:test/test.dart';

import '../operations.mocks.dart';

const id = '62c19a04c6a1b8393595ccfc';

const recipe = Recipe(
  id: id,
  title: 'Banana bread',
);

void main() {
  late RecipeDao dao;
  late Queue queue;
  late CreateShowRecipe showRecipe;
  late CreateRemoveRecipe removeRecipe;

  Future<Queue> connectQueue() => Future.value(queue);

  setUp(() {
    dao = MockRecipeDao();
    queue = MockQueue();
    showRecipe = CreateShowRecipe(dao);
    removeRecipe = CreateRemoveRecipe(dao, showRecipe, connectQueue);

    when(dao.getById(id: id)) //
        .thenAnswer((_) => Future.value(recipe));

    when(dao.deleteById(id: id)) //
        .thenAnswer((_) => Future.value(recipe));

    when(queue.add(anything)) //
        .thenAnswer((_) => Future.value());
  });

  group('AddRecipe', () {
    test(
      'throws when the recipe was not found',
      () {
        when(dao.getById(id: id)).thenAnswer((_) => Future.value(null));

        expect(
          removeRecipe(id: id),
          throwsA(isA<NlIruoyCommonV0ModelsError>()),
        );
      },
    );

    test(
      'does not throw when the recipe was found',
      () {
        expect(
          removeRecipe(id: id),
          completes,
        );
      },
    );

    test(
      'calls dao.deleteById with the correct parameters',
      () async {
        await removeRecipe(id: id);

        verify(dao.deleteById(id: id)).called(1);
      },
    );

    test(
      'publishes an event when completing normally',
      () async {
        await removeRecipe(id: id);

        verify(queue.add(anything)).called(1);
      },
    );
  });
}
