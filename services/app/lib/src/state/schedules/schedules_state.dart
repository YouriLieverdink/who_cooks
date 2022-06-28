part of 'schedules_bloc.dart';

abstract class SchedulesState extends Equatable {
  const SchedulesState();

  @override
  List<Object?> get props => [];
}

class SchedulesInitial extends SchedulesState {
  const SchedulesInitial();
}

class SchedulesLoading extends SchedulesState {
  const SchedulesLoading();
}

class SchedulesLoaded extends SchedulesState {
  const SchedulesLoaded({
    required this.schedules,
  });

  final List<Schedule> schedules;

  @override
  List<Object?> get props => [schedules];
}

class SchedulesNotLoaded extends SchedulesState {
  const SchedulesNotLoaded({
    required this.error,
  });

  final NlIruoyCommonV0ModelsError error;

  @override
  List<Object?> get props => [error];
}
