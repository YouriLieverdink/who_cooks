import 'package:formz/formz.dart';

enum IngredientInputError { empty }

class IngredientInput extends FormzInput<String, IngredientInputError> {
  const IngredientInput.pure() : super.pure('');

  const IngredientInput.dirty({String value = ''}) : super.dirty(value);

  @override
  IngredientInputError? validator(String value) {
    if (value.isEmpty) {
      return IngredientInputError.empty;
    }

    return null;
  }
}
