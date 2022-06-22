import 'package:mongo_dart/mongo_dart.dart';

import './nl_iruoy_whocooks_schedules_json.dart';

class NlIruoyWhocooksScheduleDao {
  final Future<Db> Function() connect;

  NlIruoyWhocooksScheduleDao({
    required this.connect,
  });

  Future<List<NlIruoyWhocooksSchedulesModelsSchedule>> get({
    int? limit,
    int? skip,
  }) async {
    final c = await connect();

    final aggregate = [
      {r'$limit': limit ?? 100},
      {r'$skip': skip ?? 0},
      {
        r'$addFields': {
          'id': {r'$toString': r'$_id'}
        }
      },
      {
        r'$sort': {'date': -1}
      }
    ];

    final data = await c //
        .collection('schedules')
        .modernAggregate(aggregate)
        .toList();

    return data //
        .map(NlIruoyWhocooksSchedulesModelsSchedule.fromJson)
        .toList();
  }

  Future<NlIruoyWhocooksSchedulesModelsSchedule> post(
    NlIruoyWhocooksSchedulesModelsScheduleForm scheduleForm,
  ) async {
    final c = await connect();

    final _id = ObjectId();

    await c //
        .collection('schedules')
        .insertOne({'_id': _id, ...scheduleForm.toJson()});

    return NlIruoyWhocooksSchedulesModelsSchedule.fromJson({
      'id': _id.$oid,
      ...scheduleForm.toJson(),
    });
  }

  Future<NlIruoyWhocooksSchedulesModelsSchedule> putById(
    NlIruoyWhocooksSchedulesModelsScheduleForm scheduleForm, {
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    await c //
        .collection('schedules')
        .replaceOne(where.id(_id), scheduleForm.toJson());

    return NlIruoyWhocooksSchedulesModelsSchedule.fromJson({
      'id': _id.$oid,
      ...scheduleForm.toJson(),
    });
  }

  Future<void> deleteById({
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    await c //
        .collection('schedules')
        .deleteOne(where.id(_id));
  }
}
