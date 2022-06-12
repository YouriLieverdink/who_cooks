part of 'add_edit_cubit.dart';

class AddEditState extends Equatable {
  const AddEditState({
    this.title = const TitleInput.pure(),
    this.photoUrl,
    this.description,
    this.ingredients = const [],
    this.status = FormzStatus.pure,
  });

  final TitleInput title;

  final String? photoUrl;

  final String? description;

  final List<IngredientInput> ingredients;

  final FormzStatus status;

  AddEditState copyWith({
    TitleInput? title,
    String? photoUrl,
    String? description,
    List<IngredientInput>? ingredients,
    FormzStatus? status,
  }) {
    return AddEditState(
      title: title ?? this.title,
      photoUrl: photoUrl ?? this.photoUrl,
      description: description ?? this.description,
      ingredients: ingredients ?? this.ingredients,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props {
    return [title, photoUrl, description, ingredients, status];
  }
}
