import 'package:bloc_starter_pro/blocs/auth/auth_state.dart';
import 'package:bloc_starter_pro/services/api_service.dart';
import 'package:bloc_starter_pro/utils/local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiService _authService;

  // used dummy api
  final _loginUrl = "https://reqres.in/api/login";

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final token =
            await _authService.login(_loginUrl, event.email, event.password);
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
