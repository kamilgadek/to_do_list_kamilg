import 'package:local_storage/local_storage.dart';
import 'package:tasks_repository/tasks_repository.dart';

// TODO(kamil): move this exception class to separate file
class OpenDatabaseError implements Exception {}

class TasksRepository {
  TasksRepository({required LocalStorage localStorage}) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  static const dbName = 'tasks.db';
  static const tableName = 'tasks';

  /// Database instance
  late Database _database;

  /// based on Task model serialization
  static const tableSchema = '''
    id TEXT PRIMARY KEY,
    description TEXT NOT NULL,
    isDone INTEGER NOT NULL
  ''';

  Future<void> init() async {
    try {
      _database = await _localStorage.getDatabase(
        databaseName: dbName,
        tableName: tableName,
        tableSchema: tableSchema,
      );
    } catch (_) {
      throw OpenDatabaseError();
    }
  }

  Future<void> addTask(
    Task task,
  ) async {
    await _localStorage.add(
      table: tableName,
      db: _database,
      document: task.toJson(),
    );
  }

  Future<List<Task>> getTasks() async {
    final list = await _localStorage.get(
      table: tableName,
      db: _database,
    );
    return list
        .map(
          (e) => Task.fromJson(e),
        )
        .toList();
  }
}
