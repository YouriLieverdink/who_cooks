import 'dart:convert';

import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';

import '../generated/IruoyWhocooksRecipesV0Json.dart';

class InternalController {
  ///
  static RouterPlus get router {
    //
    return RouterPlus() //
      ..use(setContentType('application/json'))
      ..get('/healthcheck', _get);
  }

  static Future<Response> _get(
    Request request,
  ) async {
    //
    final database = await connect();

    if (!database.isConnected) {
      final data = Error(
        code: 'database',
        message: 'The database could not be connected to.',
      );

      return Response(500, body: jsonEncode(data));
    }

    final data = Healthcheck(status: 'Healthy');

    return Response(200, body: jsonEncode(data));
  }
}
