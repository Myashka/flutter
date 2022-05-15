import 'package:bloc_hive/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_hive/dashboard/model/user_model.dart';
import 'package:bloc_hive/user_detail/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.user,
    required this.index,
    required this.showUserUpdateDialog,
  }) : super(key: key);
  final User user;
  final int index;
  final VoidCallback showUserUpdateDialog;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(user.key.toString()),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (_) {
        BlocProvider.of<DashboardBloc>(context).add(
          RemoveUserEvent(
            id: user.id,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserDetails(
                  user: user,
                ),
              ),
            );
          },
          key: Key(user.key.toString()),
          leading: CircleAvatar(
            child: Text(
              (index + 1).toString(),
            ),
          ),
          title: Text(user.name),
          subtitle: Text(user.email),
          trailing: GestureDetector(
            onTap: () {
              showUserUpdateDialog();
            },
            child: const Icon(
              Icons.update,
            ),
          ),
        ),
      ),
    );
  }
}
