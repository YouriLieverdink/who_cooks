import 'package:recipes/recipes.dart';

export 'package:mongo_dart/mongo_dart.dart' show Db, ObjectId;
export 'package:queue/queue.dart' show Queue;

var _db = Db(mongoUri);
var _queue = Queue(rabbitUri);

Future<T> connect<T>() async {
  //
  switch (T) {
    case Db:
      if (!_db.isConnected) await _db.open();
      return _db as T;

    case Queue:
      await _queue.open();
      return _queue as T;

    default:
      throw Exception();
  }
}
