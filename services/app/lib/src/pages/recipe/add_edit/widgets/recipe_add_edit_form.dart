import 'package:app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_edit.dart';

class RecipeAddEditForm extends StatelessWidget {
  const RecipeAddEditForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: const [
            TitleField(),
            SizedBox(height: kPadding / 2),
            PhotoUrlField(),
            SizedBox(height: kPadding / 2),
            DescriptionField(),
            SizedBox(height: kPadding / 2),
            IngredientFieldList(),
          ],
        ),
      ),
      floatingActionButton: const InvokeButton(),
    );
  }
}
