import 'package:local_storage/local_storage.dart';
import 'package:tasks_repository/tasks_repository.dart';
class TasksRepository {
  final localStorage  = LocalStorage(databaseName: 'tasks.db');

  // Pobiera wszystkie zadania z bazy danych
  Future<List<Map<String, dynamic>>> getTasks() async {
    return await localStorage.getDocuments(collection: 'Tasks');
  }

  // Dodaje nowe zadanie do bazy danych
  Future<void> addTask(String content) async {
    await localStorage.addDocument(collection: 'Tasks', document: {
      
    });
  }

  // Edytuje istniejące zadanie w bazie danych
  Future<void> editTask(int id, String newContent, int status) async {
    await localStorage.editTask(id, newContent, status);
  }

  Future<void> deleteTask(int taskId) async {
    await localStorage.deleteTask(taskId);
  }
}
