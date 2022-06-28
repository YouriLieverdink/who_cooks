import 'dart:convert';

import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';

class RecipeController {
  ///
  static Future<Response> get(
    Request request,
  ) async {
    //
    final query = request.url.queryParameters;

    final ids = (query['ids'] ?? '').split(',');
    final title = query['title'];
    final limit = int.tryParse(query['limit'] ?? '');
    final skip = int.tryParse(query['skip'] ?? '');

    final data = await listRecipes(
      ids: ids,
      title: title,
      limit: limit,
      skip: skip,
    );

    return Response(200, body: jsonEncode(data));
  }

  static Future<Response> post(
    Request request,
  ) async {
    //
    final json = await request.body.asJson;
    final form = RecipeForm.fromJson(json);

    final data = await addRecipe(form);

    return Response(201, body: jsonEncode(data));
  }

  static Future<Response> getById(
    Request request,
    String id,
  ) async {
    //
    try {
      final data = await showRecipe(id: id);

      return Response(200, body: jsonEncode(data));
    } //
    on NlIruoyCommonV0ModelsError {
      //
      return Response(404);
    }
  }

  static Future<Response> putById(
    Request request,
    String id,
  ) async {
    //
    final json = await request.body.asJson;
    final form = RecipeForm.fromJson(json);

    try {
      final data = await editRecipe(form, id: id);

      return Response(200, body: jsonEncode(data));
    } //
    on NlIruoyCommonV0ModelsError {
      //
      return Response(404);
    }
  }

  static Future<Response> deleteById(
    Request request,
    String id,
  ) async {
    //
    try {
      await removeRecipe(id: id);

      return Response(204);
    } //
    on NlIruoyCommonV0ModelsError {
      //
      return Response(404);
    }
  }
}
