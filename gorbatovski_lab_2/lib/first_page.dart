// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageFromState();
}

class _MyHomePageFromState extends State<MyHomePage> {
  static const String _url = "https://http.cat/";

  final _controller = TextEditingController();
  bool texterror = false;

  @override
  void initState() {
    _controller.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP cat status code"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Print some status code',
                    style: TextStyle(fontSize: 20.0, color: Colors.black)),
              ),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Status code',
                  errorText: texterror ? 'Enter correct Status code' : null,
                ),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  if (int.tryParse(_controller.text) is! int ||
                      _controller.text.isEmpty) {
                    setState(() {
                      texterror = true;
                    });
                  } else {
                    setState(() {
                      texterror = false;
                    });
                    String url = '$_url' '${_controller.text}';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(url: url),
                      ),
                    );
                    _controller.clear();
                  }
                },
                child: const Text("Let's try!"),
              ),
            ],
          ),
          width: 400,
        ),
      ),
    );
  }
}
