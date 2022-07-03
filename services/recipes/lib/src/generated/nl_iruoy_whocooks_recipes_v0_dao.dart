import 'package:mongo_dart/mongo_dart.dart';
import './nl_iruoy_whocooks_recipes_v0_json.dart';

extension Conditional on SelectorBuilder {
  SelectorBuilder when(
      bool apply, SelectorBuilder Function(SelectorBuilder) other,
      {SelectorBuilder Function(SelectorBuilder)? orElse}) {
    return apply
        ? other(this)
        : orElse != null
            ? orElse(this)
            : this;
  }
}

class NlIruoyWhocooksRecipesV0ModelsRecipeDao {
  NlIruoyWhocooksRecipesV0ModelsRecipeDao({required this.connect}) {
    connect().then((c) => c..ensureIndex('recipes', key: 'title'));
  }

  final Future<Db> Function() connect;

  Future<List<NlIruoyWhocooksRecipesV0ModelsRecipe>> get(
      {List<String>? ids, String? title, int? limit, int? skip}) async {
    final c = await connect();
    final _ids = ids?.map(ObjectId.parse).toList();
    final data = await c.collection('recipes').modernFind(
        limit: limit,
        skip: skip != 0 ? skip : null,
        selector: where.when(ids != null, (s) => s.oneFrom('_id', _ids!)).when(
            title != null,
            (s) => s.match('title', '.*$title.*', caseInsensitive: true)));
    return data
        .map((v) => {...v, 'id': (v['_id'] as ObjectId).$oid})
        .map((v) => NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(v))
        .toList();
  }

  Future<NlIruoyWhocooksRecipesV0ModelsRecipe> insert(
      NlIruoyWhocooksRecipesV0ModelsRecipeForm recipeForm) async {
    final c = await connect();
    final _id = ObjectId();
    await c
        .collection('recipes')
        .insertOne({'id': _id, ...recipeForm.toJson()});
    return NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(
        {'id': _id.$oid, ...recipeForm.toJson()});
  }

  Future<NlIruoyWhocooksRecipesV0ModelsRecipe?> getById(
      {required String id}) async {
    final c = await connect();
    final _id = ObjectId.parse(id);
    final data =
        await c.collection('recipes').modernFindOne(selector: where.id(_id));
    return data == null
        ? null
        : NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(data);
  }

  Future<NlIruoyWhocooksRecipesV0ModelsRecipe> updateById(
      NlIruoyWhocooksRecipesV0ModelsRecipeForm recipeForm,
      {required String id}) async {
    final c = await connect();
    final _id = ObjectId.parse(id);
    await c
        .collection('recipes')
        .replaceOne(where.id(_id), recipeForm.toJson());
    return NlIruoyWhocooksRecipesV0ModelsRecipe.fromJson(
        {'id': _id.$oid, ...recipeForm.toJson()});
  }

  Future<void> deleteById({required String id}) async {
    final c = await connect();
    final _id = ObjectId.parse(id);
    await c.collection('recipes').deleteOne(where.id(_id));
  }
}
