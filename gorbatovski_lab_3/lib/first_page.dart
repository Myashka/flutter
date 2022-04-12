import 'package:flutter/material.dart';
import 'package:gorbatovski_lab_2/input_prodiver.dart';
import 'package:provider/provider.dart';
import 'second_page.dart';
import 'package:validators/validators.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP cat status code"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          width: 500,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: Text('Turns statsus code of your link', style: TextStyle(fontSize: 24.0, color: Colors.black)),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Print some web site', style: TextStyle(fontSize: 20.0, color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'URL'),
                  ),
                ),
              ),
              const SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isEmpty || !isURL(_controller.text)) {
                    print("error");
                  } else {
                    String url = _controller.text;
                    context.read<InputProvider>().fetchStatusCode(url);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(url: url)));
                    _controller.clear();
                  }
                },
                child: const Text("Let's try!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
