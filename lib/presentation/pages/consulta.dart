import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto4_bola8/cubit/textfield_data_cubit.dart';
import 'package:proyecto4_bola8/widgets/button_submit.dart';
import 'package:proyecto4_bola8/widgets/texto_field.dart';

class ConsultaPage extends StatelessWidget {
  const ConsultaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: true,
        right: true,
        bottom: true,
        top: true,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            Text(
              'Escribe tu pregunta',
              style: GoogleFonts.jua(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 25)),
            const TextoField(),
            BlocBuilder<TextfieldDataCubit, TextfieldDataState>(
                builder: (context, state) {
              return AnimatedOpacity(
                  opacity: state.complete ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: const Text('Press the 8 ball to submit'));
            }),
            const Padding(padding: EdgeInsets.only(top: 50)),
            ButtonSubmit(
              userQuestion: '',
            ),
          ]),
        ),
      ),
    );
  }
}
