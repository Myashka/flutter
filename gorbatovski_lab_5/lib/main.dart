import 'package:bloc_hive/dashboard/bloc/dashboard_bloc.dart';
import 'package:bloc_hive/dashboard/dashboard_page.dart';
import 'package:bloc_hive/dashboard/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) => DashboardBloc(
          userRepository: RepositoryProvider.of<UserRepository>(context),
        )..add(InitUserBox()),
        child: const MaterialApp(
          home: DashboardPage(),
        ),
      ),
    );
  }
}
