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
  ButtonsMessages get buttons => ButtonsMessages(this);
  PagesMessages get pages => PagesMessages(this);
  HintsMessages get hints => HintsMessages(this);
  ResourcesMessages get resources => ResourcesMessages(this);
  LabelsMessages get labels => LabelsMessages(this);
  ValidationMessages get validation => ValidationMessages(this);
}

class ButtonsMessages {
  final Messages _parent;
  const ButtonsMessages(this._parent);
  String get add => """Add""";
  String get edit => """Edit""";
  String get save => """Save""";
}

class PagesMessages {
  final Messages _parent;
  const PagesMessages(this._parent);
  String get recipes => """Recipes""";
  String get schedule => """Schedule""";
  String get search => """Search""";
}

class HintsMessages {
  final Messages _parent;
  const HintsMessages(this._parent);
  String get thisWeek => """This week""";
  String get nextWeek => """Next week""";
  String get add => """Add""";
  String get edit => """Edit""";
  String get noResults => """No results""";
  String noYet(String resource) => """No $resource yet""";
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

class LabelsMessages {
  final Messages _parent;
  const LabelsMessages(this._parent);
  String get title => """Title""";
  String get description => """Description""";
  String get photoUrl => """Photo url""";
}

class ValidationMessages {
  final Messages _parent;
  const ValidationMessages(this._parent);
  String empty(String field) => """The $field is required""";
}

Map<String, String> get messagesMap => {
      """buttons.add""": """Add""",
      """buttons.edit""": """Edit""",
      """buttons.save""": """Save""",
      """pages.recipes""": """Recipes""",
      """pages.schedule""": """Schedule""",
      """pages.search""": """Search""",
      """hints.thisWeek""": """This week""",
      """hints.nextWeek""": """Next week""",
      """hints.add""": """Add""",
      """hints.edit""": """Edit""",
      """hints.noResults""": """No results""",
      """labels.title""": """Title""",
      """labels.description""": """Description""",
      """labels.photoUrl""": """Photo url""",
    };
