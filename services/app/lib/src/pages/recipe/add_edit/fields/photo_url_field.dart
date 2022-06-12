import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_edit.dart';

class PhotoUrlField extends StatelessWidget {
  const PhotoUrlField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditCubit, AddEditState>(
      buildWhen: (previous, current) {
        return previous.photoUrl != current.photoUrl;
      },
      builder: (context, state) {
        return TextFormField(
          initialValue: state.photoUrl,
          onChanged: context.read<AddEditCubit>().setPhotoUrl,
          decoration: const InputDecoration(
            label: Text('Photo url'),
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}
