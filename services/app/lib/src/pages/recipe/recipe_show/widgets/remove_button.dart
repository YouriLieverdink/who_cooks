import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../config/constants.dart';
import '../recipe_show.dart';

class RecipeRemoveButton extends StatelessWidget {
  const RecipeRemoveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<RecipeRemoveCubit, RecipeRemoveState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: kDuration,
          child: state.submission == FormzStatus.submissionInProgress //
              ? SizedBox.square(
                  dimension: 24.0,
                  child: CircularProgressIndicator(
                    color: theme.iconTheme.color,
                    strokeWidth: 2.0,
                  ),
                )
              : IconButton(
                  onPressed: context.read<RecipeRemoveCubit>().submit,
                  icon: Icon(
                    Icons.delete,
                    color: theme.iconTheme.color,
                  ),
                ),
        );
      },
    );
  }
}
