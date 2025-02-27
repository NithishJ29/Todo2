import '../models/tasks.dart';

abstract class TaskRepository {
  Future<void> createTask(Task task);
  Future<void> deleteTask(Task task);
  Future<void> updateTask(Task task);
  Future<List<Task>> getAllTasks();
}
