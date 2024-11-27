import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String description,
    required int isDone,
  }) = _Task;

  const Task._();

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);

  bool get isTaskDone => isDone == 1;
}
