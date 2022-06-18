// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'messages.i18n.dart';

String get _languageCode => 'nl';
String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i18n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i18n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i18n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class MessagesNl extends Messages {
  const MessagesNl();
  String get locale => "nl";
  String get languageCode => "nl";
  PagesMessagesNl get pages => PagesMessagesNl(this);
  LabelsMessagesNl get labels => LabelsMessagesNl(this);
  HintsMessagesNl get hints => HintsMessagesNl(this);
}

class PagesMessagesNl extends PagesMessages {
  final MessagesNl _parent;
  const PagesMessagesNl(this._parent) : super(_parent);
  String get recipes => """Recepten""";
  String get schedule => """Planning""";
}

class LabelsMessagesNl extends LabelsMessages {
  final MessagesNl _parent;
  const LabelsMessagesNl(this._parent) : super(_parent);
  String get ingredients => """Ingrediënten""";
}

class HintsMessagesNl extends HintsMessages {
  final MessagesNl _parent;
  const HintsMessagesNl(this._parent) : super(_parent);
  String get thisWeek => """Deze week""";
  String get nextWeek => """Volgende week""";
}

Map<String, String> get messagesNlMap => {
      """pages.recipes""": """Recepten""",
      """pages.schedule""": """Planning""",
      """labels.ingredients""": """Ingrediënten""",
      """hints.thisWeek""": """Deze week""",
      """hints.nextWeek""": """Volgende week""",
    };
