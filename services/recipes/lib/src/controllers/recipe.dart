import 'dart:convert';

import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';
import 'package:validation/validation.dart';

class RecipeController {
  ///
  static Future<Response> get(
    Request request,
  ) async {
    //
    final dao = RecipeDaoImp();
    final data = await dao.find();

    return Response(200, body: jsonEncode(data));
  }

  static Future<Response> post(
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
      final error = NlIruoyCommonV0ModelsError(
        code: 'validation-error',
        message: errors.values.join(', '),
      );

      return Response(400, body: jsonEncode(error));
    }

    final form = RecipeForm.fromJson(json);

    final dao = RecipeDaoImp();
    final data = await dao.insert(form);

    return Response(201, body: jsonEncode(data));
  }

  static Future<Response> putById(
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
      final error = NlIruoyCommonV0ModelsError(
        code: 'validation-error',
        message: errors.values.join(', '),
      );

      return Response(400, body: jsonEncode(error));
    }

    final form = RecipeForm.fromJson(json);

    final dao = RecipeDaoImp();
    final data = await dao.updateById(form, id: id);

    return Response(200, body: jsonEncode(data));
  }

  static Future<Response> deleteById(
    Request request,
    String id,
  ) async {
    //
    final dao = RecipeDaoImp();
    await dao.deleteById(id: id);

    return Response(204);
  }
}
