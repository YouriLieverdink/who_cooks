import 'package:formz/formz.dart';

enum TitleInputError { empty }

class TitleInput extends FormzInput<String, TitleInputError> {
  const TitleInput.pure() : super.pure('');

  const TitleInput.dirty({String value = ''}) : super.dirty(value);

  @override
  TitleInputError? validator(String value) {
    if (value.isEmpty) {
      return TitleInputError.empty;
    }

    return null;
  }
}
