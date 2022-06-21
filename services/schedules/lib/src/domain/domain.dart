import 'package:mongo_dart/mongo_dart.dart';
import 'package:schedules/schedules.dart';

var db = Db(uriString);

Future<Db> connect() async {
  //
  if (!db.isConnected) await db.open();

  return db;
}
