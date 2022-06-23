import 'package:queue/queue.dart';
import 'package:recipes/recipes.dart';

final _queue = Queue(host: rabbitUri);

Future<Queue> getQueue() async {
  // We don't need to check if it's already open, it's done internally.
  await _queue.open();

  return _queue;
}
