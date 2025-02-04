import 'package:bloc_starter_pro/blocs/auth/auth_event.dart';
import 'package:bloc_starter_pro/blocs/auth/auth_state.dart';
import 'package:bloc_starter_pro/blocs/user_bloc/user_bloc.dart';
import 'package:bloc_starter_pro/blocs/user_bloc/user_state.dart';
import 'package:bloc_starter_pro/config/theme/app_theme.dart';
import 'package:bloc_starter_pro/widgets/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';
import '../blocs/network/internet_cubit.dart';

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
          backgroundColor: AppColorTheme.secondary,
          actions: [
            IconButton(
              onPressed: () async {
                final shouldLogout = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirm Logout'),
                    content: const Text('Do you really want to sign out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Logout'),
                      ),
                    ],
                  ),
                );
                if (shouldLogout == true) {
                  context.read<AuthBloc>().add(LogoutRequested());
                }
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: MultiBlocListener(
            listeners: [
              BlocListener<InternetCubit, InternetState>(
                  listener: (context, state) {
                if (state == InternetState.disconnected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No internet connection')),
                  );
                }
              }),
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthInitial) {
                    Navigator.pushReplacementNamed(context, '/login');
                  }
                },
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
            child: BlocBuilder<InternetCubit, InternetState>(
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
                        return const Center(
                            child: Text('Failed to load user data.'));
                      }
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}
