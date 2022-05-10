import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';
import 'cat_http_event.dart';
import 'cat_http_state.dart';

class CatHttpBloc extends Bloc<CatHttpEvent, CatHttpState> {
  CatHttpBloc() : super(InitialState()) {
    on<LoadEvent>(_loadData);
  }

  Future<void> _loadData(
    LoadEvent event,
    Emitter<CatHttpState> emit,
  ) async {
    try {
      emit(LoadingState());
      final url = Uri.parse(event.inputUrl);
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.get(url);
      final _catHttp = CatHttp.fromResponse(response);
      emit(LoadedState(catHttp: _catHttp));
    } catch (e) {
      emit(FailedState(errorMessage: e.toString()));
    }
  }
}
