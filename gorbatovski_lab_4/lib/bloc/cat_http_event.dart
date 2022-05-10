import 'package:equatable/equatable.dart';

abstract class CatHttpEvent extends Equatable {
  const CatHttpEvent();

  @override
  List<Object> get props => [];
}

class LoadEvent extends CatHttpEvent {
  const LoadEvent({
    required this.inputUrl,
  });
  final String inputUrl;
}
