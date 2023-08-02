import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto4_bola8/cubit/cubit/accelerometer_data_cubit_cubit.dart';
import 'package:proyecto4_bola8/cubit/textfield_data_cubit.dart';
import 'package:proyecto4_bola8/presentation/pages/consulta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<TextfieldDataCubit>(
                create: (context) => TextfieldDataCubit()),
            BlocProvider<AccelerometerDataCubit>(
                create: (context) => AccelerometerDataCubit())
          ],
          child: const ConsultaPage(),
        ));
  }
}
