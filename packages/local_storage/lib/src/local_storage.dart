import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalStorage {
  final String databaseName;
  Database? _db;
  // constructor
  LocalStorage({required this.databaseName});

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'tasks.db');
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE tasks(
            id INTEGER PRIMARY KEY,
            conctent TEXT NOT NULL,
            status INTEGER NOT NULL
          )
          ''');
      },
    );
    return database;
  }

  /// Add new document to the table database
  Future<void> addDocument({
    required String collection,
    required Map<String, dynamic> document,
  }) async {
    final db = await database;
    await db.insert(
      collection,
      document,
    );
  }

  // Pobierz wszystkie zadania
  Future<List<Map<String, dynamic>>> getDocuments({
    required String collection,
  }) async {
    final db = await database;
    return await db.query(collection);
  }

  Future<void> editTask(int id, String newContent, int status) async {
    final db = await database;
    await db.update(
       'tasks',
      {
        'content': newContent,
        'status' : status,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
