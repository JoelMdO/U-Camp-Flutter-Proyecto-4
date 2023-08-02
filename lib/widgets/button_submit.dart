import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto4_bola8/cubit/textfield_data_cubit.dart';
import 'package:proyecto4_bola8/widgets/open_dialog.dart';

// ignore: must_be_immutable
class ButtonSubmit extends StatefulWidget {
  String userQuestion;
  ButtonSubmit({
    required this.userQuestion,
    super.key,
  });

  @override
  State<ButtonSubmit> createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit>
    with TickerProviderStateMixin {
  bool isTaped = false;
  late AnimationController _controller;
  String userQuestionInfo = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 320,
        height: 300,
        child: Stack(
          children: [
            Image.asset('assets/Group 6.png'),
            Positioned(
                top: 80, left: 0, child: Image.asset('assets/Group 3.png')),
            Positioned(
                bottom: 5, right: 0, child: Image.asset('assets/Group 4.png')),
            Positioned(
                top: 30, right: 0, child: Image.asset('assets/Group 5.png')),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isTaped = true;
                  });
                  _rotateBall();
                  final userQuestionInfo =
                      context.read<TextfieldDataCubit>().state.userQuestion;
                  OpenDialog.openDS(context, userQuestionInfo);
                },
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => Transform.rotate(
                      angle: _controller.value * 6.3,
                      child: SizedBox(
                          width: isTaped ? 150 : 120,
                          height: isTaped ? 150 : 120,
                          child: Image.asset('assets/Bola_8.png'))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _rotateBall() {
    _controller.reset();
    _controller.forward();
  }
}
