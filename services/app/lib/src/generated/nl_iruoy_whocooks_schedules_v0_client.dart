import 'package:http/http.dart';
import 'dart:convert';
import './nl_iruoy_whocooks_schedules_v0_json.dart';

class NlIruoyCommonV0ModelsHealthcheckResource {
  const NlIruoyCommonV0ModelsHealthcheckResource(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<NlIruoyCommonV0ModelsHealthcheck> get() async {
    final r = await client.get(Uri.parse('$baseUrl/_internal_/healthcheck'));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return NlIruoyCommonV0ModelsHealthcheck.fromJson(json);
      case 422:
        throw Exception([r.statusCode, null]);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200, 422.'
        ]);
    }
  }
}

class NlIruoyWhocooksSchedulesV0ModelsScheduleResource {
  const NlIruoyWhocooksSchedulesV0ModelsScheduleResource(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<List<NlIruoyWhocooksSchedulesV0ModelsSchedule>> get(
      {List<String>? ids,
      String? recipe,
      int limit = 100,
      int skip = 0}) async {
    final r = await client
        .get(Uri.parse('$baseUrl/schedules').replace(queryParameters: {
      'ids': jsonEncode(ids?.map((v) => v).toList()),
      'recipe': jsonEncode(recipe),
      'limit': jsonEncode(limit),
      'skip': jsonEncode(skip)
    }));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return (json as List)
            .map((v) => NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson(v))
            .toList();
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200.'
        ]);
    }
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule> post(
      NlIruoyWhocooksSchedulesV0ModelsScheduleForm scheduleForm) async {
    final r = await client.post(Uri.parse('$baseUrl/schedules'),
        body: jsonEncode(scheduleForm));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 201:
        return NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson(json);
      case 400:
        throw Exception([r.statusCode, null]);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 201, 400.'
        ]);
    }
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule> putById(
      NlIruoyWhocooksSchedulesV0ModelsScheduleForm scheduleForm,
      {required String id}) async {
    final r = await client.put(Uri.parse('$baseUrl/schedules/$id'),
        body: jsonEncode(scheduleForm));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson(json);
      case 400:
        throw Exception([r.statusCode, null]);
      case 404:
        throw Exception([r.statusCode, null]);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200, 400, 404.'
        ]);
    }
  }

  Future<void> deleteById({required String id}) async {
    final r = await client.delete(Uri.parse('$baseUrl/schedules/$id'));
    // final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 204:
        return;
      case 404:
        throw Exception([r.statusCode, null]);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 204, 404.'
        ]);
    }
  }
}

class NlIruoyWhocooksSchedulesV0Client {
  const NlIruoyWhocooksSchedulesV0Client(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  NlIruoyCommonV0ModelsHealthcheckResource get healthchecks {
    return NlIruoyCommonV0ModelsHealthcheckResource(
        baseUrl: baseUrl, client: client);
  }

  NlIruoyWhocooksSchedulesV0ModelsScheduleResource get schedules {
    return NlIruoyWhocooksSchedulesV0ModelsScheduleResource(
        baseUrl: baseUrl, client: client);
  }
}
