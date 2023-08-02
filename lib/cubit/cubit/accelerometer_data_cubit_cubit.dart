import 'package:bloc/bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';
part 'accelerometer_data_cubit_state.dart';

class AccelerometerDataCubit extends Cubit<AccelerometerDataCubitState> {
  AccelerometerDataCubit() : super(AccelerometerDataCubitState()) {
    void updateAccelerometerData(bool isShaked) {
      accelerometerEvents.listen((AccelerometerEvent event) {
        if (event.x.abs() > 9.0 || event.y.abs() > 9.0 || event.z.abs() > 9.0) {
          emit(state.copyWith(isShaked: true));
        } else {
          emit(state.copyWith(isShaked: false));
        }
      });
    }
  }
}
