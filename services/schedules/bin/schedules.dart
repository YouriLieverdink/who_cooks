import 'package:schedules/schedules.dart';
import 'package:shelf_plus/shelf_plus.dart';

void main() async {
  //
  await $.allReady();
  await shelfRun(handler, defaultBindAddress: '0.0.0.0');

  final queue = await $.getAsync<Queue>();

  queue.on<NlIruoyWhocooksRecipesV0UnionsRecipeEvent>(
    (event) => event.continued(upsertRecipe, deleteRecipe),
  );
}
