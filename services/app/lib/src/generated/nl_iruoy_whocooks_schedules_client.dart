import 'package:http/http.dart';
import 'dart:convert';
import './nl_iruoy_whocooks_schedules_json.dart';

class NlIruoyCommonModelsHealthcheckResource {
  const NlIruoyCommonModelsHealthcheckResource(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<NlIruoyCommonModelsHealthcheck> get() async {
    final r = await client.get(Uri.parse('$baseUrl/_internal_/healthcheck'));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return NlIruoyCommonModelsHealthcheck.fromJson(json);
      case 422:
        throw NlIruoyCommonModelsError.fromJson(json);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200, 422.'
        ]);
    }
  }
}

class NlIruoyWhocooksSchedulesModelsScheduleResource {
  const NlIruoyWhocooksSchedulesModelsScheduleResource(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  Future<List<NlIruoyWhocooksSchedulesModelsSchedule>> get(
      {num limit = 100, num skip = 0}) async {
    final r = await client.get(Uri.parse('$baseUrl/schedules').replace(
        queryParameters: {
          'limit': jsonEncode(limit),
          'skip': jsonEncode(skip)
        }));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return (json as List)
            .map((v) => NlIruoyWhocooksSchedulesModelsSchedule.fromJson(v))
            .toList();
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200.'
        ]);
    }
  }

  Future<NlIruoyWhocooksSchedulesModelsSchedule> post(
      NlIruoyWhocooksSchedulesModelsScheduleForm scheduleForm) async {
    final r = await client.post(Uri.parse('$baseUrl/schedules'),
        body: jsonEncode(scheduleForm));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 201:
        return NlIruoyWhocooksSchedulesModelsSchedule.fromJson(json);
      case 400:
        throw NlIruoyCommonModelsError.fromJson(json);
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 201, 400.'
        ]);
    }
  }

  Future<NlIruoyWhocooksSchedulesModelsSchedule> putById(
      NlIruoyWhocooksSchedulesModelsScheduleForm scheduleForm,
      {required String id}) async {
    final r = await client.put(Uri.parse('$baseUrl/schedules/$id'),
        body: jsonEncode(scheduleForm));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 200:
        return NlIruoyWhocooksSchedulesModelsSchedule.fromJson(json);
      case 400:
        throw NlIruoyCommonModelsError.fromJson(json);
      case 404:
        throw json;
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 200, 400, 404.'
        ]);
    }
  }

  Future<void> deleteById({required String id}) async {
    final r = await client.delete(Uri.parse('$baseUrl/schedules/$id'));
    final json = jsonDecode(r.body);
    switch (r.statusCode) {
      case 204:
        return json;
      case 404:
        throw json;
      default:
        throw Exception([
          r.statusCode,
          'Unsupported status code: ${r.statusCode}, expected 204, 404.'
        ]);
    }
  }
}

class NlIruoyWhocooksSchedulesClient {
  const NlIruoyWhocooksSchedulesClient(
      {required this.client, required this.baseUrl});

  final Client client;

  final String baseUrl;

  NlIruoyCommonModelsHealthcheckResource get healthchecks {
    return NlIruoyCommonModelsHealthcheckResource(
        baseUrl: baseUrl, client: client);
  }

  NlIruoyWhocooksSchedulesModelsScheduleResource get schedules {
    return NlIruoyWhocooksSchedulesModelsScheduleResource(
        baseUrl: baseUrl, client: client);
  }
}
