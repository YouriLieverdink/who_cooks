part of 'recipe_remove_cubit.dart';

class RecipeRemoveState extends Equatable {
  const RecipeRemoveState({
    required this.id,
    this.submission = FormzStatus.pure,
  });

  final String id;

  final FormzStatus submission;

  RecipeRemoveState copyWith({
    FormzStatus? submission,
  }) {
    return RecipeRemoveState(
      id: id,
      submission: submission ?? this.submission,
    );
  }

  @override
  List<Object> get props => [id, submission];
}
