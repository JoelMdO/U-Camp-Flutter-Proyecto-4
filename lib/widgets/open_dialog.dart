import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto4_bola8/cubit/cubit/accelerometer_data_cubit_cubit.dart';
import 'package:proyecto4_bola8/utils/colors.dart';
import 'dart:math';
import 'package:proyecto4_bola8/widgets/random_answer.dart';
// import 'package:sensors_plus/sensors_plus.dart';

class OpenDialog {
  static Future<void> openDS(
      BuildContext context, String userQuestionInfo) async {
    ///[generateRandomAnswer] to determine if the TextField has a question or not
    ///and accordingly provide a random answer
    Random random = Random();
    String generateRandomAnswer(String userQuestionInfo) {
      if (userQuestionInfo.isNotEmpty) {
        return RandomAnswer.answers[random.nextInt(9)];
      } else {
        return "Escribe tu pregunta primero.";
      }
    }

    ///[userAnswer] to store the random answer
    final userAnswer = generateRandomAnswer(userQuestionInfo);
    final isShakedinfo = context.read<AccelerometerDataCubit>().state.isShaked;
    final userAnswerAcel = RandomAnswer.answers[random.nextInt(9)];

    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          double screenWidth = MediaQuery.of(context).size.width / 2;
          double screenHeight = MediaQuery.of(context).size.height / 2;
          // return StatefulBuilder(builder: (context, setState) {
          // accelerometerEvents.listen((AccelerometerEvent event) {
          // // //   // setState(() {
          //     if (event.x.abs() > 9.0 ||
          //         event.y.abs() > 9.0 ||
          //         event.z.abs() > 9.0) {
          // isShaked = true;
          //     context.read<AccelerometerDataCubit>().updateAccelerometerData(true);
          //     } else {
          //       isShaked = false;
          //}
          //});
          // // // });
          return AlertDialog(
              title: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colores.grey, Colores.greenblue])),
                  width: screenWidth / 2,
                  height: screenHeight * 0.1,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 5, left: 10),
//DIALOG TITLE//
                      child: Text(
                        'RESPUESTA:',
                        style: GoogleFonts.jua(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20),
                      ))),

//DIALOG TEXT//
              content: Text(isShakedinfo ? userAnswerAcel : userAnswer),
//CLOSE BUTTON AND NOTE REFERENCE TO SHAKE THE MOBILE FOR NEW ANSWER//
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: 50,
                        height: 20,
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
                                fontSize: 14),
                          ),
                        ))),
                Text('or Shake the mobile to get a new answer',
                    style: GoogleFonts.jua(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w800,
                        color: Colores.greenblue,
                        fontSize: 12)),
              ]);
        });
  }
}
