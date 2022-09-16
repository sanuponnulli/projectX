import 'package:asw/apiservice.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_bloc_event.dart';
part 'user_bloc_state.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBlocBloc() : super(UserBlocInitial()) {
    on<Intialize>((event, emit) async {
      final data = await getdata(2);
      return emit(UserBlocState(user: data, isEnd: false, isLoading: false));
      // TODO: implement event handler
    });
    on<Loadmore>((event, emit) async {
      final data = await getdata(1);
      return emit(UserBlocState(user: data, isEnd: true, isLoading: false));
      // TODO: implement event handler
    });
  }
}
