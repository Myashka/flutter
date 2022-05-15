import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_hive/dashboard/model/user_model.dart';
import 'package:bloc_hive/dashboard/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final UserRepository userRepository;
  DashboardBloc({required this.userRepository}) : super(DashboardInitial()) {
    on<InitUserBox>(_initUserBox);
    on<FetchAllUserEvent>(_fetchAllUser);
    on<AddUserEvent>(_addNewUser);
    on<RemoveUserEvent>(_removeUser);
    on<UpdateUserEvent>(_updateUser);
  }

  FutureOr<void> _fetchAllUser(
      FetchAllUserEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final userList = userRepository.getUsers();
      emit(DashboardLoaded(userList: userList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }

  FutureOr<void> _addNewUser(
      AddUserEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final updatedUserList = await userRepository.addUser(event.user);
      emit(DashboardLoaded(userList: updatedUserList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }

  FutureOr<void> _initUserBox(
      InitUserBox event, Emitter<DashboardState> emit) async {
    await userRepository.init();
    add(FetchAllUserEvent());
  }

  FutureOr<void> _removeUser(
      RemoveUserEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final updatedUserList = await userRepository.removeUser(event.id);
      emit(DashboardLoaded(userList: updatedUserList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }

  FutureOr<void> _updateUser(
      UpdateUserEvent event, Emitter<DashboardState> emit) async {
    try {
      emit(DashboardLoading());
      final updatedUserList = await userRepository.updateUserInfo(event.user);
      emit(DashboardLoaded(userList: updatedUserList));
    } catch (e) {
      emit(DashboardError(error: e.toString()));
    }
  }
}
