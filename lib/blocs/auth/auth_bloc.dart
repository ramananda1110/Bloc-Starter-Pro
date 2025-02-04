import 'package:bloc_starter_pro/blocs/auth/auth_state.dart';
import 'package:bloc_starter_pro/data/repositories/auth_repository.dart';
import 'package:bloc_starter_pro/utils/local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final token =
            await _authRepository.loginUser(event.email, event.password);
        await LocalStorage.saveToken(token);
        emit(AuthAuthenticated(token: token));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });

    on<LogoutRequested>((event, emit) async {
      await LocalStorage.clearToken();

      emit(AuthInitial());
    });

    on<AuthCheckStatus>((event, emit) async {
      final token = await LocalStorage.getToken();
      if (token != null) {
        emit(AuthAuthenticated(token: token));
      } else {
        emit(AuthInitial());
      }
    });
  }
}
