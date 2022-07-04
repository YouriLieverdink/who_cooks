import 'package:app/config/constants.dart';
import 'package:app/src/pages/recipe/recipe_show/recipe_show.dart';
import 'package:app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RecipeRemoveButton extends StatelessWidget {
  const RecipeRemoveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeData>();

    return BlocBuilder<RecipeRemoveCubit, RecipeRemoveState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: kDuration,
          child: Conditional(
            state.submission == FormzStatus.submissionInProgress,
            isTrue: (_) {
              return SizedBox.square(
                dimension: 24.0,
                child: CircularProgressIndicator(
                  color: theme.colorScheme.onPrimary,
                  strokeWidth: 2.0,
                ),
              );
            },
            isFalse: (_) {
              return IconButton(
                onPressed: () {
                  context.read<RecipeRemoveCubit>().submit();
                },
                icon: Icon(
                  Icons.delete,
                  color: theme.colorScheme.onPrimary,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
