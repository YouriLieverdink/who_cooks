import 'package:mongo_dart/mongo_dart.dart';

import '../config.dart';
import '../generated/IruoyWhocooksV0RecipesDao.dart' as _;

var db = Db(uriString);

Future<Db> connect() async {
  //
  if (!db.isConnected) await db.open();

  return db;
}

class RecipeDao extends _.RecipeDao {
  RecipeDao() : super(connect: connect);
}
