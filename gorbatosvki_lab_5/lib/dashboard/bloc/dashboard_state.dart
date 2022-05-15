part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<User> userList;
  const DashboardLoaded({
    required this.userList,
  });
}

class DashboardError extends DashboardState {
  final String error;
  const DashboardError({
    required this.error,
  });
}
