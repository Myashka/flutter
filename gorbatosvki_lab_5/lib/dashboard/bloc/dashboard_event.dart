part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class InitUserBox extends DashboardEvent {}

class FetchAllUserEvent extends DashboardEvent {}

class AddUserEvent extends DashboardEvent {
  final User user;
  const AddUserEvent({
    required this.user,
  });
}

class RemoveUserEvent extends DashboardEvent {
  final String id;
  const RemoveUserEvent({
    required this.id,
  });
}

class UpdateUserEvent extends DashboardEvent {
  final User user;
  const UpdateUserEvent({
    required this.user,
  });
}
