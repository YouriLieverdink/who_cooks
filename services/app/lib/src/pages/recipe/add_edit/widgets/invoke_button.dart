import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../add_edit.dart';

class InvokeButton extends StatelessWidget {
  const InvokeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<AddEditCubit, AddEditState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () async {
            await context.read<AddEditCubit>().addEdit();
          },
          child: state.status == FormzStatus.submissionInProgress //
              ? SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: CircularProgressIndicator(
                    color: theme.colorScheme.onSecondary,
                    strokeWidth: 4.0,
                  ),
                )
              : const Icon(Icons.save),
        );
      },
    );
  }
}
