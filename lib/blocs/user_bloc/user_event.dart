import 'package:equatable/equatable.dart';

abstract class UserListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadUserList extends UserListEvent {}
