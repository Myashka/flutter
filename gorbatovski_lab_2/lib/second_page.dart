import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<CatHttp> fetchStatusCode(url) async {
  final response = await http.get(Uri.parse(url));

  return CatHttp.fromResponse(response);
}

class CatHttp {
  final int statusCode;
  //late final Image image;

  CatHttp({required this.statusCode}); //{
  //image = Image.network('https://http.cat/' '{$statusCode}');
  //}

  factory CatHttp.fromResponse(http.Response response) {
    return CatHttp(statusCode: response.statusCode);
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();
  late Future<CatHttp> futureStatusCode;

  @override
  void initState() {
    super.initState();
    futureStatusCode = fetchStatusCode(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: Text(widget.url),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<CatHttp>(
            future: futureStatusCode,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.network(
                    'https://http.cat/' '${snapshot.data!.statusCode}');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
