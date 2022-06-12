import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_edit.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditCubit, AddEditState>(
      buildWhen: (previous, current) {
        return previous.description != current.description;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.description,
          onChanged: context.read<AddEditCubit>().setDescription,
          decoration: const InputDecoration(
            label: Text('Description'),
            border: OutlineInputBorder(),
            alignLabelWithHint: true,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: 5,
        );
      },
    );
  }
}
