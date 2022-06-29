import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants.dart';

class BaseField extends StatelessWidget {
  const BaseField({
    Key? key,
    this.value,
    this.label,
    this.icon,
    this.error,
    this.isMultiline = false,
    this.hasBorders = true,
    this.hasAutofocus = false,
    this.onChanged,
  }) : super(key: key);

  /// The value to display within the field.
  final String? value;

  /// The label to display above the field.
  final String? label;

  /// The icon to display within the field.
  final IconData? icon;

  /// Error text to display below the field in red.
  final String? error;

  /// Whether this field should span multiple lines.
  final bool isMultiline;

  /// Whether the borders should be shown.
  final bool hasBorders;

  /// Whether autofocus should be enabled.
  final bool hasAutofocus;

  /// The function which is called on every value change.
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeData>();

    return TextFormField(
      initialValue: value,
      onChanged: onChanged,
      autofocus: hasAutofocus,
      decoration: InputDecoration(
        prefixIcon: icon != null //
            ? Icon(icon)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadius),
          borderSide: hasBorders //
              ? const BorderSide()
              : BorderSide.none,
        ),
        label: label != null //
            ? Text(label!)
            : null,
        errorText: error,
        alignLabelWithHint: isMultiline,
        filled: true,
        fillColor: theme.scaffoldBackgroundColor,
      ),
      minLines: isMultiline ? 3 : null,
      maxLines: isMultiline ? 5 : 1,
    );
  }
}
