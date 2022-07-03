import 'package:recipes/recipes.dart';

class CreateShowHealthcheck {
  //
  const CreateShowHealthcheck(
    this.connectDb,
    this.connectQueue,
  );

  final Future<Db> Function() connectDb;

  final Future<Queue> Function() connectQueue;

  Future<NlIruoyCommonV0ModelsHealthcheck> call() async {
    try {
      await connectDb();
    } //
    catch (_) {
      throw const NlIruoyCommonV0ModelsError(
        code: 'database',
        message: 'No connection could be established to the database.',
      );
    }

    try {
      await connectQueue();
    } //
    catch (_) {
      throw const NlIruoyCommonV0ModelsError(
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
