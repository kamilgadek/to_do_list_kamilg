import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalStorage {
  const LocalStorage();

  /// Return the instance of Database
  Future<Database> getDatabase({
    required String databaseName,
    required String tableName,
    required String tableSchema,
  }) async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, databaseName);

    final db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $tableName(
            $tableSchema
          )
          ''');
      },
    );
    return db;
  }

  /// Add new document to the table database
  Future<void> add({
    required String table,
    required Database db,
    required Map<String, dynamic> document,
  }) async {
    await db.insert(
      table,
      document,
    );
  }

  /// get all documents from the table database
  Future<List<Map<String, dynamic>>> get({
    required Database db,
    required String table,
  }) async {
    return await db.query(table);
  }

  /// edit document in the table database by `where` condition
  Future<void> edit({
    required Database db,
    required String table,
    required String wherePropertyName,
    required String wherePropertyValue,
    required Map<String, dynamic> document,
  }) async {
    await db.update(
      table,
      document,
      where: '$wherePropertyName = ?',
      whereArgs: [wherePropertyValue],
    );
  }

  Future<void> delete({
    required Database db,
    required String table,
    required String wherePropertyName,
    required String wherePropertyValue,
  }) async {
    await db.delete(
      table,
      where: '$wherePropertyName = ?',
      whereArgs: [wherePropertyValue],
    );
  }
}
