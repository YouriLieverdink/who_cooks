import 'package:app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../di.dart';
import '../recipe_add_edit.dart';

class RecipeSubmitButton extends StatelessWidget {
  ///
  static final translations = $.get<Translations>();

  const RecipeSubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<RecipeAddEditCubit, RecipeAddEditState>(
      buildWhen: (previous, current) {
        return previous.status != current.status;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          duration: kDuration,
          opacity: state.status.isValid ? 1 : .5,
          child: FloatingActionButton.extended(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kButtonSize / 3),
            ),
            label: Text(translations.messages.buttons.save),
            icon: AnimatedSwitcher(
              duration: kDuration,
              child: state.submission == FormzStatus.submissionInProgress //
                  ? SizedBox.square(
                      dimension: 24.0,
                      child: CircularProgressIndicator(
                        color: theme.colorScheme.onSecondary,
                        strokeWidth: 2.0,
                      ),
                    )
                  : const Icon(Icons.save),
            ),
            onPressed: state.status.isValid //
                ? () => context.read<RecipeAddEditCubit>().submit()
                : null,
          ),
        );
      },
    );
  }
}
