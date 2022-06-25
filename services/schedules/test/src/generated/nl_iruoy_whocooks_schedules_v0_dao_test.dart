import 'package:schedules/schedules.dart';
import 'package:test/test.dart';

final mockRecipes = [
  NlIruoyWhocooksRecipesV0ModelsRecipe(
    id: ObjectId().$oid,
    title: 'Banana bread',
    ingredients: [],
  ),
  NlIruoyWhocooksRecipesV0ModelsRecipe(
    id: ObjectId().$oid,
    title: 'Mexican taco\'s',
    ingredients: [],
  ),
  NlIruoyWhocooksRecipesV0ModelsRecipe(
    id: ObjectId().$oid,
    title: 'Fish & chips',
    ingredients: [],
  ),
];

final mockSchedules = [
  Schedule(
    id: ObjectId().$oid,
    date: DateTime(2022, 6, 20),
    recipes: [
      mockRecipes[0],
    ],
    days: [],
  ),
  Schedule(
    id: ObjectId().$oid,
    date: DateTime(2022, 6, 27),
    recipes: [
      mockRecipes[1],
    ],
    days: [],
  ),
  Schedule(
    id: ObjectId().$oid,
    date: DateTime(2022, 7, 4),
    recipes: [
      mockRecipes[2],
    ],
    days: [],
  ),
];

void main() {
  late Db database;

  setUp(() async {
    await database.drop();
  });

  setUpAll(() async {
    database = Db('mongodb://127.0.0.1');
    await database.open();
  });

  tearDownAll(() async {
    await database.close();
  });

  group('NlIruoyWhocooksScheduleDao', () {
    late NlIruoyWhocooksScheduleDao dao;

    setUp(() {
      dao = NlIruoyWhocooksScheduleDao(connect: () async => database);
    });

    group('get', () {
      test('returns an empty list when no items are stored', () async {
        final data = await dao.get();

        expect(
          data.isEmpty,
          isTrue,
        );
      });

      test('returns items when there are items stored', () async {
        final inserted = await Future.wait(
          mockSchedules //
              .map((v) => ScheduleForm.fromJson(v.toJson()))
              .map((v) => dao.insert(v)),
        );

        final data = await dao.get();

        expect(
          data,
          equals(inserted),
        );
      });

      test('returns only items where the id is within ids', () async {
        final inserted = await Future.wait(
          mockSchedules //
              .map((v) => ScheduleForm.fromJson(v.toJson()))
              .map((v) => dao.insert(v)),
        );

        final value = inserted[1];

        final data = await dao.get(ids: [value.id]);

        expect(
          data,
          equals([value]),
        );
      });

      test('returns only items where recipes contains recipe', () async {
        final inserted = await Future.wait(
          mockSchedules //
              .map((v) => ScheduleForm.fromJson(v.toJson()))
              .map((v) => dao.insert(v)),
        );

        final value = inserted[1];

        final data = await dao.get(recipe: value.recipes.first);

        expect(
          data,
          equals([value]),
        );
      });

      test('limits the output when limit is provided', () async {
        await Future.wait(
          mockSchedules //
              .map((v) => ScheduleForm.fromJson(v.toJson()))
              .map((v) => dao.insert(v)),
        );

        final data = await dao.get(limit: 2);

        expect(
          data.length,
          equals(2),
        );
      });

      test('skips documents when skip is provided', () async {
        final inserted = await Future.wait(
          mockSchedules //
              .map((v) => ScheduleForm.fromJson(v.toJson()))
              .map((v) => dao.insert(v)),
        );

        final data = await dao.get(skip: 1);

        expect(
          data,
          inserted.sublist(1),
        );
      });
    });
  });
}
