part of 'recipe_add_edit_cubit.dart';

class RecipeAddEditState extends Equatable with FormzMixin {
  const RecipeAddEditState({
    this.title = const TitleInput.pure(),
    this.description = '',
    this.photoUrl = '',
    this.submission = FormzStatus.pure,
  });

  final TitleInput title;

  final String? description;

  final String? photoUrl;

  final FormzStatus submission;

  RecipeAddEditState copyWith({
    TitleInput? title,
    String? description,
    String? photoUrl,
    FormzStatus? submission,
  }) {
    return RecipeAddEditState(
      title: title ?? this.title,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
      submission: submission ?? this.submission,
    );
  }

  @override
  List<Object?> get props => [title, description, photoUrl, submission];

  @override
  List<FormzInput> get inputs => [title];
}
