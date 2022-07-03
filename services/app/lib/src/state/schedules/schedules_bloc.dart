import 'package:app/src/generated/generated.dart';
import 'package:app/src/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedules_event.dart';
part 'schedules_state.dart';

class SchedulesBloc extends Bloc<SchedulesEvent, SchedulesState> {
  /// The repository to use.
  final Repository repository;

  SchedulesBloc({
    required this.repository,
  }) : super(const SchedulesInitial()) {
    on<_Failure>(_onFailure);
    on<LoadSchedules>(_onLoadSchedules);
  }

  void _onFailure(
    _Failure event,
    Emitter<SchedulesState> emit,
  ) {
    var error = event.error;

    if (error is NlIruoyCommonV0ModelsError) {
      return emit(SchedulesNotLoaded(error: error));
    }

    error = const NlIruoyCommonV0ModelsError(
      code: 'unknown',
      message: 'An unknown error occured.',
    );

    emit(SchedulesNotLoaded(error: error));
  }

  Future<void> _onLoadSchedules(
    LoadSchedules event,
    Emitter<SchedulesState> emit,
  ) async {
    emit(const SchedulesLoading());

    try {
      final schedules = await repository.schedules.schedules.get(
        skip: event.skip,
        limit: event.limit,
      );

      emit(SchedulesLoaded(schedules: schedules));
    } //
    catch (e) {
      add(_Failure(error: e));
    }
  }
}
