import 'package:bloc_hive/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_hive/dashboard/widget/user_tile.dart';
import 'package:bloc_hive/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showUserAddDialog(
            context,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DashboardLoaded) {
            if (state.userList.isNotEmpty) {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  endIndent: 20,
                  indent: 20,
                ),
                itemCount: state.userList.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserTile(
                    user: state.userList[index],
                    index: index,
                    showUserUpdateDialog: () {
                      showUserUpdateDialog(
                        context,
                        state.userList[index],
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text("No User Found"),
              );
            }
          }
          if (state is DashboardError) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }
}
