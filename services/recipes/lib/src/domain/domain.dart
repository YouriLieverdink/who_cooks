import 'package:mongo_dart/mongo_dart.dart';
import 'package:recipes/recipes.dart';

final _database = Db(mongoUri);

Future<Db> getDatabase() async {
  // We only want to open a single connection.
  if (!_database.isConnected) {
    await _database.open();
  }

  return _database;
}

class RecipeDao extends NlIruoyWhocooksRecipeDao {
  RecipeDao() : super(connect: () => getDatabase());
}
