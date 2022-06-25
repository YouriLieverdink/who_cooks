import 'package:mongo_dart/mongo_dart.dart';

import './nl_iruoy_whocooks_schedules_v0_json.dart';

extension A on SelectorBuilder {
  SelectorBuilder when(
    bool apply,
    SelectorBuilder Function(SelectorBuilder) other, {
    SelectorBuilder Function(SelectorBuilder)? orElse,
  }) {
    return apply
        ? other(this)
        : orElse != null
            ? orElse(this)
            : this;
  }
}

class NlIruoyWhocooksScheduleDao {
  final Future<Db> Function() connect;

  NlIruoyWhocooksScheduleDao({
    required this.connect,
  }) {
    //
    connect().then((c) => c
      ..ensureIndex('schedules', key: 'date')
      ..ensureIndex('schedules', key: 'recipes'));
  }

  Future<List<NlIruoyWhocooksSchedulesV0ModelsSchedule>> get({
    List<String>? ids,
    NlIruoyWhocooksRecipesV0ModelsRecipe? recipe,
    int? limit,
    int? skip,
  }) async {
    //
    final c = await connect();

    final _ids = ids //
        ?.map(ObjectId.parse)
        .toList();

    final data = await c //
        .collection('schedules')
        .modernFind(
          limit: limit,
          skip: skip,
          selector: where
              .when(
                ids != null,
                (s) => s.oneFrom('_id', _ids!),
              )
              .when(
                recipe != null,
                (s) => s.oneFrom('recipes', [recipe!.toJson()]),
              ),
        );

    return data //
        .map((v) => {...v, 'id': (v['_id'] as ObjectId).$oid})
        .map(NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson)
        .toList();
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule> insert(
    NlIruoyWhocooksSchedulesV0ModelsScheduleForm scheduleForm,
  ) async {
    //
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

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule?> getById({
    required String id,
  }) async {
    //
    final c = await connect();

    final _id = ObjectId.parse(id);

    final data = await c //
        .collection('schedules')
        .modernFindOne(selector: where.id(_id));

    return data != null //
        ? NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson(data)
        : null;
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule> updateById(
    NlIruoyWhocooksSchedulesV0ModelsScheduleForm scheduleForm, {
    required String id,
  }) async {
    //
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
    //
    final c = await connect();

    final _id = ObjectId.parse(id);

    await c //
        .collection('schedules')
        .deleteOne(where.id(_id));
  }
}
