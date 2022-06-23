import 'package:mongo_dart/mongo_dart.dart';
import 'package:schedules/schedules.dart';

var db = Db(mongoUri);

Future<Db> connect() async {
  //
  if (!db.isConnected) await db.open();

  await db.ensureIndex('schedules', key: 'date');

  return db;
}

class ScheduleDao extends NlIruoyWhocooksScheduleDao {
  ScheduleDao() : super(connect: connect);
}
