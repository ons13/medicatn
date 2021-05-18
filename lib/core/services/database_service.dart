
import 'package:medicatn/core/constants/queries.dart';
import 'package:medicatn/core/datasource/database_initializer.dart';
import 'package:medicatn/core/models/medicament.dart';

import '../locator.dart';

class DatabaseService {
  DatabaseInitializer _databaseInitializer = locator<DatabaseInitializer>();

  Future<List<Medicament>> getAllMedicamentCategories() async {
    try {
      var dbClient = await _databaseInitializer.db;
      var res = await dbClient.rawQuery(allMedicamentCategories);
      List<Medicament> list = res.isNotEmpty
          ? res.map((c) => Medicament.fromMap(c)).toList()
          : List.empty();
      dbClient.close();
      return list.toSet().toList();
    } catch (e) {
      print("[Database Service] getAllMedsCategories $e");
      return List.empty();
    }
  }

  Future<List<Medicament>> getAllsubCategory(String criteria) async {
    try {
      var dbClient = await _databaseInitializer.db;
      var res = await dbClient.rawQuery(subCategories + criteria + "';");
      List<Medicament> list = res.isNotEmpty
          ? res.map((c) => Medicament.fromMap(c)).toList()
          : List.empty();
      dbClient.close();
      return list.toSet().toList();
    } catch (e) {
      print("[Database Service] getAllsubCategories $e");
      return List.empty();
    }
  }

  Future<List<Medicament>> getMedicamentsByName(String criteria) async {
    try {
      var dbClient = await _databaseInitializer.db;
      var res = await dbClient.rawQuery(allMedicaments + criteria + "';");
      List<Medicament> list = res.isNotEmpty
          ? res.map((c) => Medicament.fromMap(c)).toList()
          : null;
      return list;
    } catch (e) {
      print("[Database Service] getAllMeds $e");
      return List.empty();
    }
  }
}
