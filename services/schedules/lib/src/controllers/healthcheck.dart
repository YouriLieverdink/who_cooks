import 'dart:convert';

import 'package:schedules/schedules.dart';
import 'package:shelf_plus/shelf_plus.dart';

class HealthcheckController {
  ///
  static Future<Response> get(
    Request request,
  ) async {
    //
    final database = await connect();

    if (!database.isConnected) {
      final data = NlIruoyCommonModelsError(
        code: 'database',
        message: 'The database could not be connected to.',
      );

      return Response(500, body: jsonEncode(data));
    }

    final data = NlIruoyCommonModelsHealthcheck(
      status: 'Healthy',
      version: version,
    );

    return Response(200, body: jsonEncode(data));
  }
}
