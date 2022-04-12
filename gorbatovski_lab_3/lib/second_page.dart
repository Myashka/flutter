import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(url),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Column(
            children: [
              if (isLoading) const CircularProgressIndicator(),
              if (!isLoading)
                Image.network(
                    'https://http.cat/' + catHttp!.statusCode.toString())
            ],
          )),
        ),
      ),
    );
  }
}
