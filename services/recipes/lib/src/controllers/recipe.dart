import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';

class RecipeController {
  ///
  static Future<Response> get(
    Request request,
  ) async {
    //
    final query = request.url.queryParameters;

    final limit = int.tryParse(query['limit'] ?? '');
    final skip = int.tryParse(query['skip'] ?? '');

    final dao = RecipeDao();
    final data = await dao.get(limit: limit, skip: skip);

    return Response(200, body: jsonEncode(data));
  }

  static Future<Response> post(
    Request request,
  ) async {
    //
    final json = await request.body.asJson;

    final form = RecipeForm.fromJson(json);

    final dao = RecipeDao();
    final data = await dao.post(form);

    // Publish the upserted event for other services.
    final event = {
      'recipe_upserted': RecipeUpserted(
        id: ObjectId().$oid,
        timestamp: DateTime.now(),
        recipe: data,
      ).toJson(),
    };

    final queue = await $.getAsync<Queue>();
    await queue.add(RecipeEvent.fromJson(event));

    return Response(201, body: jsonEncode(data));
  }

  static Future<Response> putById(
    Request request,
    String id,
  ) async {
    //
    final json = await request.body.asJson;
    final form = RecipeForm.fromJson(json);

    final dao = RecipeDao();

    final existing = await dao.getById(id: id);

    if (existing == null) {
      // The recipe was not found and can therefor not be deleted.
      return Response(404);
    }

    final data = await dao.putById(form, id: id);

    // Publish the upserted event for other services.
    final event = {
      'recipe_upserted': RecipeUpserted(
        id: ObjectId().$oid,
        timestamp: DateTime.now(),
        recipe: data,
      ).toJson(),
    };

    final queue = await $.getAsync<Queue>();
    await queue.add(RecipeEvent.fromJson(event));

    return Response(200, body: jsonEncode(data));
  }

  static Future<Response> deleteById(
    Request request,
    String id,
  ) async {
    //
    final dao = RecipeDao();

    final existing = await dao.getById(id: id);

    if (existing == null) {
      // The recipe was not found and can therefor not be deleted.
      return Response(404);
    }

    await dao.deleteById(id: id);

    // Publish the deleted event for other services.
    final event = {
      'recipe_deleted': RecipeDeleted(
        id: ObjectId().$oid,
        timestamp: DateTime.now(),
        recipe: existing,
      ).toJson(),
    };

    final queue = await $.getAsync<Queue>();
    await queue.add(RecipeEvent.fromJson(event));

    return Response(204);
  }
}
