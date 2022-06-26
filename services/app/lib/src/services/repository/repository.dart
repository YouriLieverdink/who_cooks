import 'package:http/http.dart';

import '../../generated/generated.dart';

class Repository {
  /// The base url of the backend services.
  static const baseUrl = 'http://localhost:8000/api';

  const Repository({
    required this.recipes,
    required this.schedules,
  });

  /// The recipes client.
  final NlIruoyWhocooksRecipesV0Client recipes;

  /// The schedules client.
  final NlIruoyWhocooksSchedulesV0Client schedules;

  /// Initialises and returns an instance of `this`.
  static Repository get instance {
    final client = Client();

    return Repository(
      recipes: NlIruoyWhocooksRecipesV0Client(
        client: client,
        baseUrl: '$baseUrl/recipes',
      ),
      schedules: NlIruoyWhocooksSchedulesV0Client(
        client: client,
        baseUrl: '$baseUrl/schedules',
      ),
    );
  }
}
