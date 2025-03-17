import 'package:bloc/bloc.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/logout%20cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      // هنا يمكنك إضافة منطق تسجيل الخروج الفعلي
      // مثل: await authRepository.logout();
      await Future.delayed(const Duration(seconds: 1)); // محاكاة لعملية تسجيل الخروج
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}