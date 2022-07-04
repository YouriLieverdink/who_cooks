import 'package:flutter/material.dart';

class Conditional extends StatelessWidget {
  const Conditional(
    // ignore: avoid_positional_boolean_parameters
    this.value, {
    Key? key,
    required this.isTrue,
    this.isFalse,
  }) : super(key: key);

  final bool value;

  final Widget Function(BuildContext) isTrue;

  final Widget Function(BuildContext)? isFalse;

  @override
  Widget build(BuildContext context) {
    return value //
        ? isTrue(context)
        : isFalse != null
            ? isFalse!(context)
            : const SizedBox();
  }
}
