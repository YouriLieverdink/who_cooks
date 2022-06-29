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
  WeekdaysMessages get weekdays => WeekdaysMessages(this);
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
  String get noResults => """No results""";
  String noYet(String resource) => """No $resource yet""";
  String get addRecipe => """Click on 'edit' to add a recipe""";
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

class WeekdaysMessages {
  final Messages _parent;
  const WeekdaysMessages(this._parent);
  String get monday => """Monday""";
  String get tuesday => """Tuesday""";
  String get wednesday => """Wednesday""";
  String get thursday => """Thursday""";
  String get friday => """Friday""";
  String get saturday => """Saturday""";
  String get sunday => """Sunday""";
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
      """hints.noResults""": """No results""",
      """hints.addRecipe""": """Click on 'edit' to add a recipe""",
      """labels.title""": """Title""",
      """labels.description""": """Description""",
      """labels.photoUrl""": """Photo url""",
      """weekdays.monday""": """Monday""",
      """weekdays.tuesday""": """Tuesday""",
      """weekdays.wednesday""": """Wednesday""",
      """weekdays.thursday""": """Thursday""",
      """weekdays.friday""": """Friday""",
      """weekdays.saturday""": """Saturday""",
      """weekdays.sunday""": """Sunday""",
    };
