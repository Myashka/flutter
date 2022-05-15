import 'package:bloc_hive/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_hive/dashboard/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

Future<dynamic> showUserAddDialog(
  BuildContext context,
) {
  final nameCtlr = TextEditingController();
  final emailCtlr = TextEditingController();
  final phoneCtlr = TextEditingController();
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            TextField(
              controller: nameCtlr,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            TextField(
              controller: emailCtlr,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: phoneCtlr,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Phone",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final user = User(
                  name: nameCtlr.text,
                  email: emailCtlr.text,
                  phoneNumber: phoneCtlr.text,
                  id: const Uuid().v4(),
                );
                BlocProvider.of<DashboardBloc>(context).add(
                  AddUserEvent(user: user),
                );
                nameCtlr.clear();
                emailCtlr.clear();
                phoneCtlr.clear();
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<dynamic> showUserUpdateDialog(
  BuildContext context,
  User user,
) {
  final nameCtlr = TextEditingController();
  final emailCtlr = TextEditingController();
  final phoneCtlr = TextEditingController();
  nameCtlr.text = user.name;
  emailCtlr.text = user.email;
  phoneCtlr.text = user.phoneNumber;
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            TextField(
              controller: nameCtlr,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            TextField(
              controller: emailCtlr,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              controller: phoneCtlr,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Phone",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final updatedUser = User(
                  name: nameCtlr.text,
                  email: emailCtlr.text,
                  phoneNumber: phoneCtlr.text,
                  id: user.id,
                );
                BlocProvider.of<DashboardBloc>(context).add(
                  UpdateUserEvent(user: updatedUser),
                );
                nameCtlr.clear();
                emailCtlr.clear();
                phoneCtlr.clear();
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    ),
  );
}
