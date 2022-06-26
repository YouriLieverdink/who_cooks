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
  HintsMessages get hints => HintsMessages(this);
  ResourcesMessages get resources => ResourcesMessages(this);
}

class PagesMessages {
  final Messages _parent;
  const PagesMessages(this._parent);
  String get recipes => """Recipes""";
  String get schedule => """Schedule""";
}

class HintsMessages {
  final Messages _parent;
  const HintsMessages(this._parent);
  String get thisWeek => """This week""";
  String get nextWeek => """Next week""";
}

class ResourcesMessages {
  final Messages _parent;
  const ResourcesMessages(this._parent);
  String ingredient(int count) =>
      """${_plural(count, one: 'ingredient', many: 'ingredients')}""";
  String recipe(int count) =>
      """${_plural(count, one: 'recipe', many: 'recipes')}""";
  String schedule(int count) =>
      """${_plural(count, one: 'schedule', many: 'schedules')}""";
}

Map<String, String> get messagesMap => {
      """pages.recipes""": """Recipes""",
      """pages.schedule""": """Schedule""",
      """hints.thisWeek""": """This week""",
      """hints.nextWeek""": """Next week""",
    };
