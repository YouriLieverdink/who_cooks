import 'package:mongo_dart/mongo_dart.dart';

import '../generated/IruoyWhocooksV0RecipesDao.dart' as _;

var db = Db('mongodb://127.0.0.1/whocooks');

Future<Db> connect() async {
  //
  if (!db.isConnected) await db.open();

  return db;
}

class RecipeDao extends _.RecipeDao {
  RecipeDao() : super(connect: connect);
}
