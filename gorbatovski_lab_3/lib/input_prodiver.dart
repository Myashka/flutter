import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class CatHttp {
  final int statusCode;

  CatHttp({required this.statusCode});

  factory CatHttp.fromResponse(http.Response response) {
    return CatHttp(statusCode: response.statusCode);
  }
}

class InputProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _statusCode;

  String? get statusCode => _statusCode;

  Future<void> fetchStatusCode(url) async {
    _isLoading = true;
    CatHttp? catHttp;
    final response = await http.get(Uri.parse(url));
    catHttp = CatHttp.fromResponse(response);
    _statusCode = catHttp.statusCode.toString();
    _isLoading = false;

    notifyListeners();
  }
}
