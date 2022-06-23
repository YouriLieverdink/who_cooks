import 'package:mongo_dart/mongo_dart.dart';

import './nl_iruoy_whocooks_recipes_json.dart';

class NlIruoyWhocooksRecipeDao {
  final Future<Db> Function() connect;

  const NlIruoyWhocooksRecipeDao({
    required this.connect,
  });

  Future<List<NlIruoyWhocooksRecipesModelsRecipe>> get({
    int? limit,
    int? skip,
  }) async {
    final c = await connect();

    final aggregate = [
      {r'$limit': limit ?? 100},
      {r'$skip': skip ?? 0},
      {
        r'$addFields': {
          'id': {r'$toString': r'$_id'}
        }
      }
    ];

    final data = await c //
        .collection('recipes')
        .modernAggregate(aggregate)
        .toList();

    return data //
        .map(NlIruoyWhocooksRecipesModelsRecipe.fromJson)
        .toList();
  }

  Future<NlIruoyWhocooksRecipesModelsRecipe?> getById({
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    final data = await c //
        .collection('recipes')
        .findOne(where.id(_id));

    return data != null //
        ? NlIruoyWhocooksRecipesModelsRecipe.fromJson({
            'id': _id.$oid,
            ...data,
          })
        : null;
  }

  Future<NlIruoyWhocooksRecipesModelsRecipe> post(
    NlIruoyWhocooksRecipesModelsRecipeForm recipeForm,
  ) async {
    final c = await connect();

    final _id = ObjectId();

    await c //
        .collection('recipes')
        .insertOne({'_id': _id, ...recipeForm.toJson()});

    return NlIruoyWhocooksRecipesModelsRecipe.fromJson({
      'id': _id.$oid,
      ...recipeForm.toJson(),
    });
  }

  Future<NlIruoyWhocooksRecipesModelsRecipe> putById(
    NlIruoyWhocooksRecipesModelsRecipeForm recipeForm, {
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    await c //
        .collection('recipes')
        .replaceOne(where.id(_id), recipeForm.toJson());

    return NlIruoyWhocooksRecipesModelsRecipe.fromJson({
      'id': _id.$oid,
      ...recipeForm.toJson(),
    });
  }

  Future<void> deleteById({
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    await c //
        .collection('recipes')
        .deleteOne(where.id(_id));
  }
}
