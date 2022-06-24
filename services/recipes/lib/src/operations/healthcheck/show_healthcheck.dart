import 'package:recipes/recipes.dart';

class CreateShowHealthcheck {
  //
  const CreateShowHealthcheck({
    required this.connect,
  });

  final Future<T> Function<T>() connect;

  Future<NlIruoyCommonModelsHealthcheck> call() async {
    try {
      await connect<Db>();
    } //
    catch (_) {
      throw NlIruoyCommonModelsError(
        code: 'database',
        message: 'No connection could be established to the database.',
      );
    }

    try {
      await connect<Queue>();
    } //
    catch (_) {
      throw NlIruoyCommonModelsError(
        code: 'queue',
        message: 'No connection could be established to the queue.',
      );
    }

    return NlIruoyCommonModelsHealthcheck(
      status: 'healthy',
      version: version,
    );
  }
}
