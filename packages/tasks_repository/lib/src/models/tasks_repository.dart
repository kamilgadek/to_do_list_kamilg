import 'package:local_storage/local_storage.dart';
import 'package:tasks_repository/tasks_repository.dart';
class TasksRepository {
  final LocalStorage _localStorage = LocalStorage.instance;

  // Pobiera wszystkie zadania z bazy danych
  Future<List<Map<String, dynamic>>> getTasks() async {
    return await _localStorage.getTasks();
  }

  // Dodaje nowe zadanie do bazy danych
  Future<void> addTask(String content) async {
    await _localStorage.addTask(content);
  }

  // Edytuje istniejące zadanie w bazie danych
  Future<void> editTask(int id, String newContent, int status) async {
    await _localStorage.editTask(id, newContent, status);
  }

  Future<void> deleteTask(int taskId) async {
    await _localStorage.deleteTask(taskId);
  }
}
