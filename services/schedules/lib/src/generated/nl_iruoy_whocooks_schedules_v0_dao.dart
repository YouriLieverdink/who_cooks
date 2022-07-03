import 'package:mongo_dart/mongo_dart.dart';
import './nl_iruoy_whocooks_schedules_v0_json.dart';

extension Conditional on SelectorBuilder {
  SelectorBuilder when(
      bool apply, SelectorBuilder Function(SelectorBuilder) other,
      {SelectorBuilder Function(SelectorBuilder)? orElse}) {
    return apply
        ? other(this)
        : orElse != null
            ? orElse(this)
            : this;
  }
}

class NlIruoyWhocooksSchedulesV0ModelsScheduleDao {
  NlIruoyWhocooksSchedulesV0ModelsScheduleDao({required this.connect}) {
    connect().then((c) => c
      ..ensureIndex('schedules', key: 'date')
      ..ensureIndex('schedules', key: 'recipes'));
  }

  final Future<Db> Function() connect;

  Future<List<NlIruoyWhocooksSchedulesV0ModelsSchedule>> get(
      {List<String>? ids,
      DateTime? date,
      List<NlIruoyWhocooksRecipesV0ModelsRecipe>? recipes,
      int? limit,
      int? skip}) async {
    final c = await connect();
    final _ids = ids?.map(ObjectId.parse).toList();
    final data = await c.collection('schedules').modernFind(
        limit: limit,
        skip: skip != 0 ? skip : null,
        selector: where
            .when(ids != null, (s) => s.oneFrom('_id', _ids!))
            .when(date != null, (s) => s.eq('date', date?.toIso8601String()))
            .when(
                recipes != null,
                (s) => s.oneFrom(
                    'recipes.id', recipes?.map((v) => v.id).toList() ?? [])));
    return data
        .map((v) => {...v, 'id': (v['_id'] as ObjectId).$oid})
        .map((v) => NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson(v))
        .toList();
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule> insert(
      NlIruoyWhocooksSchedulesV0ModelsScheduleForm scheduleForm) async {
    final c = await connect();
    final _id = ObjectId();
    await c
        .collection('schedules')
        .insertOne({'id': _id, ...scheduleForm.toJson()});
    return NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson(
        {'id': _id.$oid, ...scheduleForm.toJson()});
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule?> getById(
      {required String id}) async {
    final c = await connect();
    final _id = ObjectId.parse(id);
    final data =
        await c.collection('schedules').modernFindOne(selector: where.id(_id));
    return data == null
        ? null
        : NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson(data);
  }

  Future<NlIruoyWhocooksSchedulesV0ModelsSchedule> updateById(
      NlIruoyWhocooksSchedulesV0ModelsScheduleForm scheduleForm,
      {required String id}) async {
    final c = await connect();
    final _id = ObjectId.parse(id);
    await c
        .collection('schedules')
        .replaceOne(where.id(_id), scheduleForm.toJson());
    return NlIruoyWhocooksSchedulesV0ModelsSchedule.fromJson(
        {'id': _id.$oid, ...scheduleForm.toJson()});
  }

  Future<void> deleteById({required String id}) async {
    final c = await connect();
    final _id = ObjectId.parse(id);
    await c.collection('schedules').deleteOne(where.id(_id));
  }
}
