import 'package:get_it/get_it.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:queue/queue.dart';

import './config.dart';

export 'package:mongo_dart/mongo_dart.dart' show Db;
export 'package:queue/queue.dart' show Queue;

final $ = GetIt.instance //
  ..registerSingletonAsync<Db>(
    () async => Db(mongoUri)..open(),
    dispose: (v) => v.close(),
  )
  ..registerSingletonAsync<Queue>(
    () async => Queue(rabbitUri)..open(),
    dispose: (v) => v.close(),
  );
