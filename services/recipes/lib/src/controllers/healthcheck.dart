import 'dart:convert';

import 'package:recipes/recipes.dart';
import 'package:shelf_plus/shelf_plus.dart';

class HealthcheckController {
  ///
  static Future<Response> get(
    Request request,
  ) async {
    //
    try {
      await getDatabase();
    } //
    catch (_) {
      final error = NlIruoyCommonModelsError(
        code: 'database',
        message: 'No connection could be established to the database.',
      );

      return Response(500, body: jsonEncode(error));
    }

    try {
      await getQueue();
    } //
    catch (_) {
      final error = NlIruoyCommonModelsError(
        code: 'queue',
        message: 'No connection could be established to the queue.',
      );

      return Response(500, body: jsonEncode(error));
    }

    final data = NlIruoyCommonModelsHealthcheck(
      status: 'healthy',
      version: version,
    );

    return Response(200, body: jsonEncode(data));
  }
}
