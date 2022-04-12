import 'package:flutter/material.dart';
import 'package:gorbatovski_lab_2/input_prodiver.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InputProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(url),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Column(
            children: [
              if (provider.isLoading)
                const CircularProgressIndicator()
              else if (provider.catHttp != null)
                Image.network('https://http.cat/' + provider.catHttp!.statusCode.toString())
              else
                const Text("error")
            ],
          )),
        ),
      ),
    );
  }
}
