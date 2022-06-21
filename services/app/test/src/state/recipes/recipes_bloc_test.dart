import 'package:app/src/generated/generated.dart';
import 'package:app/src/services/services.dart';
import 'package:app/src/state/recipes/recipes_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './recipes_bloc_test.mocks.dart';

const mockRecipes = [
  Recipe(id: '1', title: 'Banana bread', ingredients: []),
  Recipe(id: '2', title: 'Pasta carbonara', ingredients: []),
  Recipe(id: '3', title: 'Turkey', ingredients: []),
];

const mockError = NlIruoyCommonModelsError(
  code: 'unknown',
  message: 'Something unexpected happened...',
);

@GenerateMocks([
  Repository,
  NlIruoyWhocooksRecipesClient,
  NlIruoyWhocooksRecipesModelsRecipeResource,
])
void main() {
  late MockNlIruoyWhocooksRecipesModelsRecipeResource resource;
  late MockNlIruoyWhocooksRecipesClient client;
  late MockRepository repository;

  setUp(() {
    resource = MockNlIruoyWhocooksRecipesModelsRecipeResource();
    client = MockNlIruoyWhocooksRecipesClient();
    repository = MockRepository();

    when(repository.client).thenReturn(client);
    when(client.recipes).thenReturn(resource);
    when(resource.get(skip: anyNamed('skip'), limit: anyNamed('limit')))
        .thenAnswer((_) async => mockRecipes);
  });

  group('RecipesBloc', () {
    test('has the correct initial state', () {
      final bloc = RecipesBloc(repository: repository);

      expect(
        bloc.state,
        equals(const RecipesInitial()),
      );
    });
  });

  group('LoadRecipes', () {
    blocTest<RecipesBloc, RecipesState>(
      'calls recipes.get method on client',
      build: () => RecipesBloc(repository: repository),
      act: (bloc) => bloc.add(const LoadRecipes()),
      verify: (_) => verify(
        resource.get(skip: anyNamed('skip'), limit: anyNamed('limit')),
      ).called(1),
    );

    blocTest<RecipesBloc, RecipesState>(
      'emits RecipesLoaded with recipes on success',
      build: () => RecipesBloc(repository: repository),
      act: (bloc) => bloc.add(const LoadRecipes()),
      expect: () => const [
        RecipesLoading(),
        RecipesLoaded(recipes: mockRecipes),
      ],
    );

    blocTest<RecipesBloc, RecipesState>(
      'emits RecipesNotLoaded with error on failure',
      setUp: () {
        when(resource.get(
          skip: anyNamed('skip'),
          limit: anyNamed('limit'),
        )).thenThrow(mockError);
      },
      build: () => RecipesBloc(repository: repository),
      act: (bloc) => bloc.add(const LoadRecipes()),
      expect: () => const [
        RecipesLoading(),
        RecipesNotLoaded(error: mockError),
      ],
    );
  });
}
