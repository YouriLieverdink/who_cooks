import 'dart:convert';

import 'package:schedules/schedules.dart';
import 'package:shelf_plus/shelf_plus.dart';

class ScheduleController {
  ///
  static Future<Response> get(
    Request request,
  ) async {
    //
    final query = request.url.queryParameters;

    final limit = int.tryParse(query['limit'] ?? '');
    final skip = int.tryParse(query['skip'] ?? '');

    final dao = ScheduleDao();
    final data = await dao.get(limit: limit, skip: skip);

    return Response(200, body: jsonEncode(data));
  }

  static Future<Response> post(
    Request request,
  ) async {
    //
    try {
      final json = await request.body.asJson;

      final form = ScheduleForm.fromJson(json);

      final dao = ScheduleDao();
      final data = await dao.post(form);

      return Response(201, body: jsonEncode(data));
    } //
    on TypeError catch (e) {
      final error = NlIruoyCommonModelsError(
        code: 'invalid-json',
        message: e.toString(),
      );

      return Response(400, body: jsonEncode(error));
    }
  }

  static Future<Response> putById(
    Request request,
    String id,
  ) async {
    //
    try {
      final json = await request.body.asJson;

      final form = ScheduleForm.fromJson(json);

      final dao = ScheduleDao();
      final data = await dao.putById(form, id: id);

      return Response(200, body: jsonEncode(data));
    } //
    on TypeError catch (e) {
      final error = NlIruoyCommonModelsError(
        code: 'invalid-json',
        message: e.toString(),
      );

      return Response(400, body: jsonEncode(error));
    }
  }

  static Future<Response> deleteById(
    Request request,
    String id,
  ) async {
    //
    final dao = ScheduleDao();
    await dao.deleteById(id: id);

    return Response(204);
  }
}
