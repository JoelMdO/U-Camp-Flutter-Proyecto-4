import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto4_bola8/cubit/textfield_data_cubit.dart';
import 'package:proyecto4_bola8/widgets/appbar.dart';
import 'package:proyecto4_bola8/widgets/botton_nagivationbar.dart';
import 'package:proyecto4_bola8/widgets/button_submit.dart';
import 'package:proyecto4_bola8/widgets/texto_field.dart';

// ignore: must_be_immutable
class ConsultaPage extends StatelessWidget {
  bool completed;
  ConsultaPage({super.key, required this.completed});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TextfieldDataCubit()..updateTextFieldData(completed, ''),
      child: ConsultaPageView(
        complete: completed,
      ),
    );
  }
}

// ignore: must_be_immutable
class ConsultaPageView extends StatelessWidget {
  bool complete;
  ConsultaPageView({Key? key, required this.complete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBola8(
        title: '',
        actions: [],
      ),
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
            TextoField(),
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
      bottomNavigationBar: (const NavigationBottonBar(
        selectedIndex: 0,
      )),
    );
  }
}
