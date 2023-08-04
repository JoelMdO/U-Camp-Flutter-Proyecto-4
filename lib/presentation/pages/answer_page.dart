import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto4_bola8/cubit/cubit/accelerometer_data_cubit_cubit.dart';
import 'package:proyecto4_bola8/cubit/textfield_data_cubit.dart';
import 'package:proyecto4_bola8/presentation/pages/consulta.dart';
import 'package:proyecto4_bola8/utils/colors.dart';
import 'package:proyecto4_bola8/widgets/appbar.dart';
import 'package:proyecto4_bola8/widgets/botton_nagivationbar.dart';
import 'package:proyecto4_bola8/widgets/random_answer.dart';

class AnswerPage extends StatelessWidget {
  final String userQuestioInfo;

  const AnswerPage({super.key, required this.userQuestioInfo});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TextfieldDataCubit>(
            create: (context) => TextfieldDataCubit()),
        BlocProvider(
            create: (context) =>
                AccelerometerDataCubit()..updateAccelerometerData()),
      ],
      child: AnswerPageView(
        userQuestioInfo: userQuestioInfo,
      ),
    );
  }
}

// ignore: must_be_immutable
class AnswerPageView extends StatefulWidget {
  final String userQuestioInfo;
  const AnswerPageView({super.key, required this.userQuestioInfo});

  @override
  State<AnswerPageView> createState() => _AnswerPageViewState();
}

class _AnswerPageViewState extends State<AnswerPageView> {
  ///[generateRandomAnswer] to determine if the TextField has a question or not
  ///and accordingly provide a random answer

  Random random = Random();
  String generateRandomAnswer(String userQuestionInfo) {
    if (userQuestionInfo.isNotEmpty) {
      return RandomAnswer.answers[random.nextInt(8)];
    } else {
      return "Escribe tu pregunta primero.";
    }
  }

  @override
  Widget build(BuildContext context) {
    ///[userAnswer] to store the random answer
    final userAnswer = generateRandomAnswer(widget.userQuestioInfo);

    ///[userAnswerAgain] to store the random answer once the accelerometer is used
    final userAnswerAgain = RandomAnswer.answers[random.nextInt(8)];
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
            const Padding(padding: EdgeInsets.only(top: 150)),
            Align(
              alignment: Alignment.center,
              child: Text(
                'La respuesta es:',
                style: GoogleFonts.jua(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 25)),
            BlocBuilder<AccelerometerDataCubit, bool>(
                builder: (context, isShaked) {
              return SizedBox(
                  width: 320,
                  height: 300,
                  child: Stack(children: [
                    Image.asset('assets/Group 6.png'),
                    Positioned(
                        top: 80,
                        left: 0,
                        child: Image.asset('assets/Group 3.png')),
                    Positioned(
                        bottom: 5,
                        right: 0,
                        child: Image.asset('assets/Group 4.png')),
                    Positioned(
                        top: 30,
                        right: 0,
                        child: Image.asset('assets/Group 5.png')),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/Group 1.png'))),
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            isShaked ? userAnswerAgain : userAnswer,
                            style: GoogleFonts.jua(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ]));
            }),
//RETURN BUTTON AND NOTE REFERENCE TO SHAKE THE MOBILE FOR NEW ANSWER//
            TextButton(
                onPressed: () {
                  final completed =
                      context.read<TextfieldDataCubit>().state.complete;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ConsultaPage(
                            completed: completed,
                          )));
                },
                child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colores.greenblue,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'CLOSE',
                        style: GoogleFonts.jua(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ))),
            Text('or Shake the mobile to get a new answer',
                style: GoogleFonts.jua(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800,
                    color: Colores.greenblue,
                    fontSize: 14)),
          ]),
        ),
      ),
      bottomNavigationBar: (const NavigationBottonBar(
        selectedIndex: 0,
      )),
    );
  }
}
