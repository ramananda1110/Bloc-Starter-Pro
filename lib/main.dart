import 'package:bloc_starter_pro/blocs/auth/auth_bloc.dart';
import 'package:bloc_starter_pro/blocs/auth/auth_event.dart';
import 'package:bloc_starter_pro/blocs/network/internet_cubit.dart';
import 'package:bloc_starter_pro/blocs/news/news_bloc.dart';
import 'package:bloc_starter_pro/blocs/user_bloc/user_event.dart';
import 'package:bloc_starter_pro/config/routes/app_page.dart';
import 'package:bloc_starter_pro/config/routes/app_router.dart';
import 'package:bloc_starter_pro/data/repositories/auth_repository.dart';
import 'package:bloc_starter_pro/data/repositories/news_repository.dart';
import 'package:bloc_starter_pro/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/user_bloc/user_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(initialRoute: AppPage.initial));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  final AppRouter _appRouter = AppRouter();

  MyApp({required this.initialRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InternetCubit()),
        BlocProvider(
            create: (_) => AuthBloc(AuthRepository())..add(AuthCheckStatus())),
        BlocProvider(
            create: (_) => UserListBloc(UserRepository())..add(LoadUserList())),
        BlocProvider(
            create: (_) => NewsBloc(NewsRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: initialRoute,
        onGenerateRoute: _appRouter.generateRoute,
      ),
    );
  }
}
