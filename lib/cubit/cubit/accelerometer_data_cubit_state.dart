part of 'accelerometer_data_cubit_cubit.dart';

class AccelerometerDataCubitState {
  late bool isShaked;

  AccelerometerDataCubitState({
    this.isShaked = false,
  });
  AccelerometerDataCubitState copyWith({
    bool? isShaked,
  }) {
    return AccelerometerDataCubitState(
      isShaked: isShaked ?? this.isShaked,
    );
  }
}
