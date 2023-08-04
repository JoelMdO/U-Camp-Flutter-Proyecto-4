// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto4_bola8/utils/colors.dart';
import '../cubit/textfield_data_cubit.dart';

class TextoField extends StatelessWidget {
  TextoField({
    Key? key,
  }) : super(key: key);

  ///[myController] to obtain the information to from the question
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 380,
        height: 120,
        child: TextField(
            controller: myController,
            maxLines: 1,
            maxLength: 50,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: const BorderSide(color: Colores.greenblue)),
              filled: true,
              fillColor: Colores.grey,
            ),
            onEditingComplete: () {
              const complete = true;
              final userQuestion = myController.text;
              context
                  .read<TextfieldDataCubit>()
                  .updateTextFieldData(complete, userQuestion);
            }));
  }
}
