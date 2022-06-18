import 'package:mongo_dart/mongo_dart.dart';

import './NlIruoyWhocooksV0Json.dart';

class RecipeDao {
  final Future<Db> Function() connect;

  const RecipeDao({
    required this.connect,
  });

  Future<List<Recipe>> find({
    int limit = 25,
    int skip = 0,
  }) async {
    final c = await connect();

    final aggregate = [
      {r'$skip': skip},
      {r'$limit': limit},
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
        .map(Recipe.fromJson)
        .toList();
  }

  Future<Recipe> insert(
    RecipeForm recipeForm,
  ) async {
    final c = await connect();

    final _id = ObjectId();

    await c //
        .collection('recipes')
        .insertOne({'_id': _id, ...recipeForm.toJson()});

    return Recipe.fromJson({
      'id': _id.$oid,
      ...recipeForm.toJson(),
    });
  }

  Future<Recipe> updateById(
    RecipeForm recipeForm, {
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    await c //
        .collection('recipes')
        .replaceOne(where.id(_id), recipeForm.toJson());

    return Recipe.fromJson({
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
