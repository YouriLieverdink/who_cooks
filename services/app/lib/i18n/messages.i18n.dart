// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;

String get _languageCode => 'en';
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

class Messages {
  const Messages();
  String get locale => "en";
  String get languageCode => "en";
  PagesMessages get pages => PagesMessages(this);
  LabelsMessages get labels => LabelsMessages(this);
  HintsMessages get hints => HintsMessages(this);
}

class PagesMessages {
  final Messages _parent;
  const PagesMessages(this._parent);
  String get recipes => """Recipes""";
  String get schedule => """Schedule""";
}

class LabelsMessages {
  final Messages _parent;
  const LabelsMessages(this._parent);
  String get ingredients => """Ingredients""";
}

class HintsMessages {
  final Messages _parent;
  const HintsMessages(this._parent);
  String get thisWeek => """This week""";
  String get nextWeek => """Next week""";
}

Map<String, String> get messagesMap => {
      """pages.recipes""": """Recipes""",
      """pages.schedule""": """Schedule""",
      """labels.ingredients""": """Ingredients""",
      """hints.thisWeek""": """This week""",
      """hints.nextWeek""": """Next week""",
    };
