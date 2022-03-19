import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<int> fetchStatusCode(url) async {
  final response = await http.get(Uri.parse(url));

  return response.statusCode;
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();
  late Future<int> futureStatusCode;

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
          child: Container(
            child: FutureBuilder<int>(
              future: futureStatusCode,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Image.network(
                      'https://http.cat/' '${snapshot.data!.toString()}');
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
