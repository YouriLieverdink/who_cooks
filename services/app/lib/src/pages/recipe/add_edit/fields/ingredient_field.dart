import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_edit.dart';

class IngredientField extends StatelessWidget {
  const IngredientField({
    Key? key,
    required this.input,
    required this.onChanged,
  }) : super(key: key);

  /// The input to display.
  final IngredientInput input;

  /// The function to call whenever the value changed.
  final void Function(String value) onChanged;

  String? _error(
    IngredientInputError? error,
  ) {
    switch (error) {
      case IngredientInputError.empty:
        return 'The ingredient is required';

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: input.value,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        errorText: input.pure //
            ? null
            : _error(input.error),
      ),
    );
  }
}
