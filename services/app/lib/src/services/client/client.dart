import 'package:http/http.dart';

class Client extends BaseClient {
  @override
  Future<StreamedResponse> send(BaseRequest request) {
    //
    return request.send();
  }
}
