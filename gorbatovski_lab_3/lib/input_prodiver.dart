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

  CatHttp? _catHttp;
  CatHttp? get catHttp => _catHttp;

  Future<void> fetchStatusCode(url) async {
    _isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse(url));
    _catHttp = CatHttp.fromResponse(response);
    _isLoading = false;
    notifyListeners();
  }
}
