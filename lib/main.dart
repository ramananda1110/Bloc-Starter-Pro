import 'package:bloc_starter_pro/blocs/auth/auth_bloc.dart';
import 'package:bloc_starter_pro/blocs/auth/auth_event.dart';
import 'package:bloc_starter_pro/blocs/user_bloc/user_event.dart';
import 'package:bloc_starter_pro/cubits/internet_cubit.dart';
import 'package:bloc_starter_pro/repositories/user_repository.dart';
import 'package:bloc_starter_pro/services/api_service.dart';
import 'package:bloc_starter_pro/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/user_bloc/user_bloc.dart';
import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await LocalStorage.getToken();
  runApp(MyApp(initialRoute: token != null ? '/home' : '/'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InternetCubit()),
        BlocProvider(create: (_) => AuthBloc(ApiService())),
        BlocProvider(
          create: (context) => AuthBloc(ApiService())..add(AuthCheckStatus()),
        ),
        BlocProvider(
          create: (context) =>
              UserListBloc(UserRepository())..add(LoadUserList()),
        ),
      ],
      child: const MaterialApp(
        home: SplashPage(),
      ),
    );
  }
}
