import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gorbatovski_lab_3/bloc/cat_http_bloc.dart';
import 'package:gorbatovski_lab_3/bloc/cat_http_state.dart';

const baseUrlString = 'https://http.cat/';

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
          child: BlocBuilder<CatHttpBloc, CatHttpState>(
            builder: (context, state) {
              if (state is LoadingState) return const CircularProgressIndicator();
              if (state is LoadedState) return Image.network(baseUrlString + state.catHttp.statusCode.toString());
              if (state is FailedState) return Text(state.errorMessage);
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
