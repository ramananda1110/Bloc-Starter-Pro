import 'package:bloc_starter_pro/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<UserModel> users;

  UserListLoaded(this.users);

  @override
  List<Object?> get props => [users];
}

class UserListError extends UserListState {
  final String message;

  UserListError(this.message);

  @override
  List<Object?> get props => [message];
}
