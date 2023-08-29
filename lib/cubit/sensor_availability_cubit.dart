import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motion_sensors/motion_sensors.dart';

part 'sensor_availability_state.dart';
part 'sensor_availability_cubit.freezed.dart';

class SensorAvailabilityCubit extends Cubit<SensorAvailabilityState> {
  SensorAvailabilityCubit() : super(const SensorAvailabilityState.initial());
  void checkDeviceSensor() async {
    List<String> unavailableSensors = [];
    await motionSensors.isGyroscopeAvailable() != true
        ? unavailableSensors.add("Gyroscope")
        : null;
    await motionSensors.isAccelerometerAvailable() != true
        ? unavailableSensors.add("Accelerometer")
        : null;
    await motionSensors.isUserAccelerationAvailable() != true
        ? unavailableSensors.add("Linear Acceleration")
        : null;
    await motionSensors.isMagnetometerAvailable() != true
        ? unavailableSensors.add("Magnetometer")
        : null;
    await motionSensors.isAbsoluteOrientationAvailable() != true
        ? unavailableSensors.add("Absolute Orientation")
        : null;
    await motionSensors.isOrientationAvailable() != true
        ? unavailableSensors.add("Relative Orientation")
        : null;
    if (unavailableSensors.isEmpty) {
      emit(const _Available());
    } else {
      emit(_Unavailable(sensors: unavailableSensors));
    }
  }
}
