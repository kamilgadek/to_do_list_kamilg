part of 'home_bloc.dart';

enum HomeStatus {
  loading,
  present,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.tasks,
  });

  final HomeStatus status;
  final List<Task> tasks;

  static const initial = HomeState(
    status: HomeStatus.loading,
    tasks: <Task>[],
  );

  HomeState copyWith({
    HomeStatus? status,
    List<Task>? tasks,
  }) {
    return HomeState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props => [
        status,
        tasks,
      ];
}
