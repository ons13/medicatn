import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseInitializer extends ChangeNotifier{
  static final DatabaseInitializer _instance = new DatabaseInitializer.internal();
  factory DatabaseInitializer() => _instance;
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
  void closeDatabase(){
    _db.close();
  }

  DatabaseInitializer.internal();
  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "data_flutter.db");

    // Only copy if the database doesn't exist
    //if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
    // Load database from asset and copy
    ByteData data = await rootBundle.load(join('data', 'flutter.db'));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // Save copied asset to documents
    await new File(path).writeAsBytes(bytes);
    //}
    var ourDb = await openDatabase(path);
    return ourDb;
  }
}