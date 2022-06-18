import 'package:mongo_dart/mongo_dart.dart';
import 'package:recipes/recipes.dart';

var db = Db(uriString);

Future<Db> connect() async {
  //
  if (!db.isConnected) await db.open();

  return db;
}

class RecipeDaoImp extends RecipeDao {
  RecipeDaoImp() : super(connect: connect);
}
