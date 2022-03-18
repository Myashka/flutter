import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              "https://w-dog.ru/wallpapers/12/11/461732408995419/g-bukva-plamya-litera-ogon-alfavit.jpg",
              height: 300,
            ),
            SizedBox(
              height: 100,
            ),
            const Text(
              'IT WORKS!!!',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.plus_one),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: _decrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Color color;
  final String imageUrl;

  CardWidget({required this.color, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 400,
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                ),
                child: Image.network(
                  imageUrl,
                  height: 200,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    "Text",
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    color: Colors.red,
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              Spacer(),
              // ignore: prefer_const_constructors
              Text(
                "Text2",
              ),
              // ignore: prefer_const_constructors
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
