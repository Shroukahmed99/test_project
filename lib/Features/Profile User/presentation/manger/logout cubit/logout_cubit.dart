import 'package:bloc/bloc.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Logout%20Cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}