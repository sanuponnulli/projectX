part of 'user_bloc_bloc.dart';

class UserBlocState {
  final List user;

  const UserBlocState({required this.user});
}

class UserBlocInitial extends UserBlocState {
  UserBlocInitial() : super(user: []);
}
