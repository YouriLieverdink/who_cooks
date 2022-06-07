import 'dart:convert';

import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';
import 'package:validation/validation.dart';

import '../generated/IruoyWhocooksRecipesV0Json.dart';

class RecipeController {
  ///
  static RouterPlus get router {
    return RouterPlus() //
      ..use(setContentType('application/json'))
      ..get('/', _get)
      ..post('/', _post)
      ..put('/<id>', _putById)
      ..delete('/<id>', _deleteById);
  }

  static Future<Response> _get(
    Request request,
  ) async {
    //
    final dao = RecipeDao();
    final data = await dao.find();

    return Response(200, body: jsonEncode(data));
  }

  static Future<Response> _post(
    Request request,
  ) async {
    //
    final json = await request.body.asJson;

    // We validate the incoming body to make sure it can be parsed.
    final validator = Validator({
      'title': [Required(), IsA<String>()],
    });

    final errors = validator.validate(json);

    if (errors.isNotEmpty) {
      //
      final data = errors.entries //
          .map((v) => Error(code: v.key, message: v.value.join(', ')))
          .toList();

      return Response(400, body: jsonEncode(data));
    }

    final form = RecipeForm.fromJson(json);

    final dao = RecipeDao();
    final data = await dao.insert(form);

    return Response(201, body: jsonEncode(data));
  }

  static Future<Response> _putById(
    Request request,
    String id,
  ) async {
    //
    final json = await request.body.asJson;

    // We validate the incoming body to make sure it can be parsed.
    final validator = Validator({
      'title': [Required(), IsA<String>()],
    });

    final errors = validator.validate(json);

    if (errors.isNotEmpty) {
      //
      final data = errors.entries //
          .map((v) => Error(code: v.key, message: v.value.join(', ')))
          .toList();

      return Response(400, body: jsonEncode(data));
    }

    final form = RecipeForm.fromJson(json);

    final dao = RecipeDao();
    final data = await dao.updateById(form, id: id);

    return Response(200, body: jsonEncode(data));
  }

  static Future<Response> _deleteById(
    Request request,
    String id,
  ) async {
    //
    final dao = RecipeDao();
    await dao.deleteById(id: id);

    return Response(204);
  }
}
