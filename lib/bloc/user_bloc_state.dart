part of 'user_bloc_bloc.dart';

class UserBlocState {
  final List user;
  final bool isLoading;
  final bool isEnd;

  const UserBlocState(
      {required this.isLoading, required this.isEnd, required this.user});
}

class UserBlocInitial extends UserBlocState {
  UserBlocInitial() : super(user: [], isLoading: false, isEnd: false);
}
