import 'package:get_it/get_it.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:queue/queue.dart';
import 'package:schedules/src/config.dart';

export 'package:mongo_dart/mongo_dart.dart' show Db, ObjectId;
export 'package:queue/queue.dart' show Queue;

final $ = GetIt.instance //
  ..registerSingletonAsync<Db>(
    () async => Db('mongodb://$dbHost')..open(),
    dispose: (v) => v.close(),
  )
  ..registerSingletonAsync<Queue>(
    () async => Queue(queueHost)..open(),
    dispose: (v) => v.close(),
  );
