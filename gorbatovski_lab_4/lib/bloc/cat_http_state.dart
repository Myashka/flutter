import 'package:equatable/equatable.dart';
import 'package:gorbatovski_lab_3/models/cat_http_model.dart';

abstract class CatHttpState extends Equatable {
  const CatHttpState();

  @override
  List<Object> get props => [];
}

class InitialState extends CatHttpState {}

class LoadingState extends CatHttpState {}

class LoadedState extends CatHttpState {
  final CatHttp catHttp;

  const LoadedState({
    required this.catHttp,
  });
}

class FailedState extends CatHttpState {
  final String errorMessage;

  const FailedState({
    required this.errorMessage,
  });
}
