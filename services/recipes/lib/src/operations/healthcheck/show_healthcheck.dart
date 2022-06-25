import 'package:recipes/recipes.dart';

class CreateShowHealthcheck {
  //
  const CreateShowHealthcheck();

  Future<NlIruoyCommonV0ModelsHealthcheck> call() async {
    try {
      await $.getAsync<Db>();
    } //
    catch (_) {
      throw NlIruoyCommonV0ModelsError(
        code: 'database',
        message: 'No connection could be established to the database.',
      );
    }

    try {
      await $.getAsync<Queue>();
    } //
    catch (_) {
      throw NlIruoyCommonV0ModelsError(
        code: 'queue',
        message: 'No connection could be established to the queue.',
      );
    }

    return NlIruoyCommonV0ModelsHealthcheck(
      status: 'healthy',
      version: version,
    );
  }
}
