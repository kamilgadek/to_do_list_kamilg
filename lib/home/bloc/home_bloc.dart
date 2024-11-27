import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tasks_repository/tasks_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required TasksRepository tasksRepository,
  })  : _tasksRepository = tasksRepository,
        super(
          HomeState.initial,
        ) {
    on<GetTasks>(_onGetTasks);

    add(GetTasks());
  }

  final TasksRepository _tasksRepository;

  void _onGetTasks(
    GetTasks event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );
    try {
      final tasks = await _tasksRepository.getTasks();
      emit(
        state.copyWith(
          status: HomeStatus.present,
          tasks: tasks,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
        ),
      );
    }
  }
}
