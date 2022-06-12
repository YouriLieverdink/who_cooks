import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_edit.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    Key? key,
  }) : super(key: key);

  String? _error(
    TitleInputError? error,
  ) {
    switch (error) {
      case TitleInputError.empty:
        return 'The title is required';

      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditCubit, AddEditState>(
      buildWhen: (previous, current) {
        return previous.title != current.title;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title.value,
          onChanged: context.read<AddEditCubit>().setTitle,
          decoration: InputDecoration(
            label: const Text('Title'),
            border: const OutlineInputBorder(),
            errorText: state.title.pure //
                ? null
                : _error(state.title.error),
          ),
        );
      },
    );
  }
}
