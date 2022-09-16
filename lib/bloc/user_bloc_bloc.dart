import 'package:asw/apiservice.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBlocBloc() : super(UserBlocInitial()) {
    on<Intialize>((event, emit) async {
      final data = await getdata();
      return emit(UserBlocState(user: data));
      // TODO: implement event handler
    });
  }
}
