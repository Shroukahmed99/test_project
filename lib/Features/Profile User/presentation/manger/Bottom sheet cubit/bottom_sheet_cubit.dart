import 'package:bloc/bloc.dart';
import 'package:profile_app/Features/Profile%20User/presentation/manger/Bottom%20sheet%20cubit/bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(BottomSheetHidden());

  void toggleBottomSheet() {
    if (state is BottomSheetVisible) {
      emit(BottomSheetHidden());
    } else {
      emit(BottomSheetVisible());
    }
  }

  void hideBottomSheet() {
    emit(BottomSheetHidden());
  }

  void showBottomSheet() {
    emit(BottomSheetVisible());
  }
}