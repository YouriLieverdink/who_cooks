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
  ButtonsMessagesNl get buttons => ButtonsMessagesNl(this);
  PagesMessagesNl get pages => PagesMessagesNl(this);
  HintsMessagesNl get hints => HintsMessagesNl(this);
  ResourcesMessagesNl get resources => ResourcesMessagesNl(this);
  LabelsMessagesNl get labels => LabelsMessagesNl(this);
  ValidationMessagesNl get validation => ValidationMessagesNl(this);
}

class ButtonsMessagesNl extends ButtonsMessages {
  final MessagesNl _parent;
  const ButtonsMessagesNl(this._parent) : super(_parent);
  String get add => """Toevoegen""";
  String get edit => """Wijzigen""";
  String get save => """Opslaan""";
}

class PagesMessagesNl extends PagesMessages {
  final MessagesNl _parent;
  const PagesMessagesNl(this._parent) : super(_parent);
  String get recipes => """Recepten""";
  String get schedule => """Planning""";
}

class HintsMessagesNl extends HintsMessages {
  final MessagesNl _parent;
  const HintsMessagesNl(this._parent) : super(_parent);
  String get thisWeek => """Deze week""";
  String get nextWeek => """Volgende week""";
  String get add => """Toevoegen""";
  String get edit => """Wijzigen""";
}

class ResourcesMessagesNl extends ResourcesMessages {
  final MessagesNl _parent;
  const ResourcesMessagesNl(this._parent) : super(_parent);
  String ingredient(int count) =>
      """${_plural(count, one: 'ingrediënt', many: 'ingrediënten')}""";
  String recipe(int count) =>
      """${_plural(count, one: 'recept', many: 'recepten')}""";
  String schedule(int count) =>
      """${_plural(count, one: 'planning', many: 'planningen')}""";
}

class LabelsMessagesNl extends LabelsMessages {
  final MessagesNl _parent;
  const LabelsMessagesNl(this._parent) : super(_parent);
  String get title => """Titel""";
  String get description => """Beschrijving""";
  String get photoUrl => """Foto url""";
}

class ValidationMessagesNl extends ValidationMessages {
  final MessagesNl _parent;
  const ValidationMessagesNl(this._parent) : super(_parent);
  String empty(String field) => """De $field is verplicht""";
}

Map<String, String> get messagesNlMap => {
      """buttons.add""": """Toevoegen""",
      """buttons.edit""": """Wijzigen""",
      """buttons.save""": """Opslaan""",
      """pages.recipes""": """Recepten""",
      """pages.schedule""": """Planning""",
      """hints.thisWeek""": """Deze week""",
      """hints.nextWeek""": """Volgende week""",
      """hints.add""": """Toevoegen""",
      """hints.edit""": """Wijzigen""",
      """labels.title""": """Titel""",
      """labels.description""": """Beschrijving""",
      """labels.photoUrl""": """Foto url""",
    };
