import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetCubit extends Cubit<InternetState> {
  final InternetConnectionChecker _checker = InternetConnectionChecker();

  InternetCubit() : super(InternetState.disconnected) {
    _checker.onStatusChange.listen((status) {
      emit(status == InternetConnectionStatus.connected
          ? InternetState.connected
          : InternetState.disconnected);
    });
  }
}

enum InternetState { connected, disconnected }
