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
      final data = NlIruoyCommonV0ModelsError(
        code: 'database',
        message: 'The database could not be connected to.',
      );

      return Response(500, body: jsonEncode(data));
    }

    final data = NlIruoyCommonV0ModelsHealthcheck(
      status: 'Healthy',
      version: version,
    );

    return Response(200, body: jsonEncode(data));
  }
}
