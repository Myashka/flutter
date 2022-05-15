import 'package:bloc_hive/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_hive/dashboard/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetails extends StatelessWidget {
  UserDetails({Key? key, required this.user}) : super(key: key);
  final User user;

  final nameCtlr = TextEditingController();
  final emailCtlr = TextEditingController();
  final phoneCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DashboardLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.email,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    user.phoneNumber,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            );
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
