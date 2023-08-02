import 'package:flutter_bloc/flutter_bloc.dart';
part 'textfield_data_state.dart';

class TextfieldDataCubit extends Cubit<TextfieldDataState> {
  TextfieldDataCubit() : super(TextfieldDataState());

  void updateTextFieldData(bool complete, String userQuestion) {
    emit(state.copyWith(complete: complete, userQuestion: userQuestion));
  }
}
