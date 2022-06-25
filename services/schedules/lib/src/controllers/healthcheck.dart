import 'dart:convert';

import 'package:schedules/schedules.dart';
import 'package:shelf_plus/shelf_plus.dart';

class HealthcheckController {
  ///
  static Future<Response> get(
    Request request,
  ) async {
    //
    try {
      final data = await showHealthcheck();

      return Response(200, body: jsonEncode(data));
    } //
    catch (e) {
      //
      return Response(500, body: jsonEncode(e));
    }
  }
}
