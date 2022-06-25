import 'package:mongo_dart/mongo_dart.dart';

import './nl_iruoy_whocooks_schedules_v0_json.dart';

class NlIruoyWhocooksScheduleDao {
  final Future<Db> Function() connect;

  NlIruoyWhocooksScheduleDao({
    required this.connect,
  });

  Future<List<NlIruoyWhocooksSchedulesV0ModelsSchedule>> get({
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
        .map(NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson)
        .toList();
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule?> getById({
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    final data = await c //
        .collection('schedules')
        .findOne(where.id(_id));

    return data != null //
        ? NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson({
            'id': _id.$oid,
            ...data,
          })
        : null;
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule> post(
    NlIruoyWhocooksSchedulesV0ModelsScheduleForm scheduleForm,
  ) async {
    final c = await connect();

    final _id = ObjectId();

    await c //
        .collection('schedules')
        .insertOne({'_id': _id, ...scheduleForm.toJson()});

    return NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson({
      'id': _id.$oid,
      ...scheduleForm.toJson(),
    });
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule> putById(
    NlIruoyWhocooksSchedulesV0ModelsScheduleForm scheduleForm, {
    required String id,
  }) async {
    final c = await connect();

    final _id = ObjectId.parse(id);

    await c //
        .collection('schedules')
        .replaceOne(where.id(_id), scheduleForm.toJson());

    return NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson({
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
