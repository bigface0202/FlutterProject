import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import '../models/item_model.dart';
import 'repository.dart';

class NewsDbProvider implements Source, Cache{
  Database db; //Coming from sqflite.dart

  NewsDbProvider(){
    init();
  }

  //Todo - store and fetch top ids
  Future<List<int>>fetchTopIds(){
    return null;
  }

  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version){ //Initial setup
      //"""":multi line string, PRIMARY KEYにするとDBのindexとして認識される
        newDb.execute("""
          CREATE TABLE Items
          (
            id INTEGER PRIMARY KEY,
            type TEXT,
            by TEXT,
            time INTEGER,
            test TEXT,
            parent INTEGER,
            kids BLOB,
            dead INTEGER,
            deleted INTEGER,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          )
        """
        );
      }
    );
  }
  
  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",//?にwhereArgsのidが入る
      whereArgs: [id],
    );

    if (maps.length > 0){
      return ItemModel.fromDb(maps.first);
    }

    return null;
  }

  Future<int> addItem(ItemModel item)  {
    return db.insert("Items", item.toMap());
  }
}

final newsDbProvider = NewsDbProvider();