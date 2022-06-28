part of 'schedules_bloc.dart';

abstract class SchedulesEvent extends Equatable {
  const SchedulesEvent();

  @override
  List<Object?> get props => [];
}

class _Failure extends SchedulesEvent {
  const _Failure({
    required this.error,
  });

  final Object error;

  @override
  List<Object?> get props => [error];
}

class LoadSchedules extends SchedulesEvent {
  const LoadSchedules({
    this.skip = 0,
    this.limit = 100,
  });

  final int skip;

  final int limit;

  @override
  List<Object?> get props => [skip, limit];
}
