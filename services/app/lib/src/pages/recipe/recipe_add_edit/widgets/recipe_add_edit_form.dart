import 'package:app/config/constants.dart';
import 'package:app/src/pages/recipe/recipe_add_edit/recipe_add_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class RecipeAddEditForm extends StatelessWidget {
  const RecipeAddEditForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipeAddEditCubit, RecipeAddEditState>(
      listener: (context, state) {
        if (state.submission == FormzStatus.submissionSuccess) {
          // The operation was successfull.
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            children: const [
              TitleField(),
              SizedBox(height: kPadding),
              DescriptionField(),
              SizedBox(height: kPadding),
              PhotoUrlField(),
            ],
          ),
        ),
        floatingActionButton: const RecipeSubmitButton(),
      ),
    );
  }
}
