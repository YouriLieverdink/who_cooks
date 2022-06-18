import 'package:http/http.dart';

import '../../generated/generated.dart';

class Repository {
  /// The base url of the backend services.
  static const baseUrl = 'http://localhost:5001';

  /// The http client.
  final NlIruoyWhocooksV0Client client;

  const Repository(this.client);

  /// Initialises and returns an instance of `this`.
  static Repository get instance {
    final client = NlIruoyWhocooksV0Client(
      client: Client(),
      baseUrl: baseUrl,
    );

    return Repository(client);
  }
}
