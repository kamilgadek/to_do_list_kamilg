import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalStorage {
  static Database? _db;
  static final LocalStorage instance = LocalStorage._constructor();

  final String _tasksTableName = "tasks";
  final String _tasksIdColumnName = "id";
  final String _tasksContentColumnName = "content";
  final String _tasksStatusColumnName = "status";

  LocalStorage._constructor();

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
          CREATE TABLE $_tasksTableName(
            $_tasksIdColumnName INTEGER PRIMARY KEY,
            $_tasksContentColumnName TEXT NOT NULL,
            $_tasksStatusColumnName INTEGER NOT NULL
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
      _tasksTableName,
      {
        _tasksContentColumnName: newContent,
        _tasksStatusColumnName: status,
      },
      where: '$_tasksIdColumnName = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(
      _tasksTableName,
      where: '$_tasksIdColumnName = ?',
      whereArgs: [id],
    );
  }
}
