import 'package:bloc_starter_pro/blocs/user_bloc/user_event.dart';
import 'package:bloc_starter_pro/blocs/user_bloc/user_state.dart';
import 'package:bloc_starter_pro/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserRepository userRepository;

  UserListBloc(this.userRepository) : super(UserListInitial()) {
    on<LoadUserList>((event, emit) async {
      emit(UserListLoading());
      try {
        final users = await userRepository.fetchUsers();
        emit(UserListLoaded(users));
      } catch (e) {
        emit(UserListError("Failed to load users"));
      }
    });
  }
}
