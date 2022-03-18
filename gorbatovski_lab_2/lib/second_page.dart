import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<CatHTTP> fetchCat(String url) async {
  final response = await http.get(
    Uri.parse(url),
    headers: {"Accept": "application/json", "Access-Control_Allow_Origin": "*"},
  );

  if (response.statusCode == 200) {
    return CatHTTP.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class CatHTTP {
  final String src;

  const CatHTTP({
    required this.src,
  });

  factory CatHTTP.fromJson(Map<String, dynamic> json) {
    return CatHTTP(
      src: json['img']['src'],
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late Future<CatHTTP> futureCat;
  String? _url, _body;
  int? _status;

  @override
  void initState() {
    futureCat = fetchCat(widget.url);
    _sendGet(widget.url);
    super.initState();
  }

  void _sendGet(url) {
    http.get(Uri.parse(url)).then((response) {
      _status = response.statusCode;
      _body = response.body;
      print(_body);
    }).catchError((error) {
      _status = 0;
      _body = error.toString();
      print(_body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.url),
        ),
        body: Center(
          child: FutureBuilder<CatHTTP>(
            future: futureCat,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.network(snapshot.data!.src);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
