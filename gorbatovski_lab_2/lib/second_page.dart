import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<CatHTTP> fetchCat(String url) async {
  final response = await http.get(Uri.parse(url));

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
      src: json['src'],
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

  @override
  void initState() {
    futureCat = fetchCat(widget.url);
    super.initState();
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
