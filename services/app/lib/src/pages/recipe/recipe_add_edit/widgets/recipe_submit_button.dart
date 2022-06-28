import 'package:app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../services/services.dart';
import '../recipe_add_edit.dart';

class RecipeSubmitButton extends StatelessWidget {
  const RecipeSubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeData>();
    final translations = context.read<Translations>();

    return BlocBuilder<RecipeAddEditCubit, RecipeAddEditState>(
      buildWhen: (previous, current) {
        return previous.status != current.status;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          duration: kDuration,
          opacity: state.status.isValid ? 1 : .5,
          child: FloatingActionButton.extended(
            label: Text(
              translations.messages.buttons.save,
              style: theme.textTheme.button?.apply(
                color: theme.colorScheme.onSecondary,
              ),
            ),
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
                  : Icon(
                      Icons.save,
                      color: theme.colorScheme.onSecondary,
                    ),
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
