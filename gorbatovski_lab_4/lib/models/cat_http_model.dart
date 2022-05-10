import 'package:http/http.dart' as http;

class CatHttp {
  final int statusCode;

  CatHttp({required this.statusCode});

  factory CatHttp.fromResponse(http.Response response) {
    return CatHttp(statusCode: response.statusCode);
  }
}
