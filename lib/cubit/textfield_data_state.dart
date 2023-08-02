part of 'textfield_data_cubit.dart';

class TextfieldDataState {
  late bool complete;
  late String userQuestion;

  TextfieldDataState({this.complete = false, this.userQuestion = ''});
  TextfieldDataState copyWith({bool? complete, String? userQuestion}) {
    return TextfieldDataState(
      complete: complete ?? this.complete,
      userQuestion: userQuestion ?? this.userQuestion,
    );
  }
}
