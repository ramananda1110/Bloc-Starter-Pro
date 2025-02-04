import 'package:bloc_starter_pro/blocs/network/internet_cubit.dart';
import 'package:bloc_starter_pro/blocs/user_bloc/user_bloc.dart';
import 'package:bloc_starter_pro/blocs/user_bloc/user_state.dart';
import 'package:bloc_starter_pro/widgets/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
        listener: (context, state) {
      if (state == InternetState.disconnected) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No internet connection')),
        );
      }
    }, child: BlocBuilder<InternetCubit, InternetState>(
      builder: (context, internetState) {
        if (internetState == InternetState.disconnected) {
          return const NoInternetWidget();
        } else if (internetState == InternetState.connected) {
          return BlocBuilder<UserListBloc, UserListState>(
            builder: (context, state) {
              if (state is UserListLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserListLoaded) {
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                    );
                  },
                );
              } else {
                return const Center(child: Text('Failed to load user data.'));
              }
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
