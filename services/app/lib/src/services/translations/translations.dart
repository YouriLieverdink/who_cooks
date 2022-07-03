import 'dart:io';

import 'package:app/i18n/messages.i18n.dart';
import 'package:app/i18n/messages_nl.i18n.dart';

class Translations {
  ///
  final Messages messages;

  const Translations({
    this.messages = const Messages(),
  });

  /// Initialises and returns an instance of `this`.
  factory Translations.instance() {
    //
    final locale = Platform.localeName.substring(0, 2);

    switch (locale) {
      case 'nl':
        return const Translations(messages: MessagesNl());
      default:
        return const Translations();
    }
  }
}
