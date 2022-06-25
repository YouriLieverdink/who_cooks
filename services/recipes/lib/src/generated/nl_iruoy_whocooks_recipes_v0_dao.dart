import 'package:mongo_dart/mongo_dart.dart';

import './nl_iruoy_whocooks_recipes_v0_json.dart';

class NlIruoyWhocooksRecipeDao {
  final Future<Db> Function() connect;

  const NlIruoyWhocooksRecipeDao({
    required this.connect,
  });

  Future<List<NlIruoyWhocooksRecipesV0ModelsRecipe>> get({
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
        .map(NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson)
        .toList();
  }

  Future<NlIruoyWhocooksRecipesV0ModelsRecipe?> getById({
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    final data = await c //
        .collection('recipes')
        .findOne(where.id(_id));

    return data != null //
        ? NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson({
            'id': _id.$oid,
            ...data,
          })
        : null;
  }

  Future<NlIruoyWhocooksRecipesV0ModelsRecipe> post(
    NlIruoyWhocooksRecipesV0ModelsRecipeForm recipeForm,
  ) async {
    final c = await connect();

    final _id = ObjectId();

    await c //
        .collection('recipes')
        .insertOne({'_id': _id, ...recipeForm.toJson()});

    return NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson({
      'id': _id.$oid,
      ...recipeForm.toJson(),
    });
  }

  Future<NlIruoyWhocooksRecipesV0ModelsRecipe> putById(
    NlIruoyWhocooksRecipesV0ModelsRecipeForm recipeForm, {
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    await c //
        .collection('recipes')
        .replaceOne(where.id(_id), recipeForm.toJson());

    return NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson({
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
