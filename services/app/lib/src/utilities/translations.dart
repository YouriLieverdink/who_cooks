import '../services/services.dart';

/// Returns a list [String]s containing the days of the week.
List<String> weekdays(
  Translations translations,
) {
  final weekdays = translations.messages.weekdays;

  return [
    weekdays.monday,
    weekdays.tuesday,
    weekdays.wednesday,
    weekdays.thursday,
    weekdays.friday,
    weekdays.saturday,
    weekdays.sunday,
  ];
}
