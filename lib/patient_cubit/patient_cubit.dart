import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_app/patient_cubit/patient_model.dart';

class PatientCubit extends Cubit<List<PatientModel>> {
  PatientCubit() : super([]);

  Future<List<PatientModel>> addNewPatient(PatientModel patientModel) {
    Future<List<PatientModel>> allPatients =
        Future.delayed(const Duration(seconds: 5), () {
      state.add(patientModel);
      emit(List.of(state));
      return state;
    });
    return allPatients;
  }

  Future<List<PatientModel>> updatePatient(PatientModel patientModel) {
    Future<List<PatientModel>> updatedAllPatients =
        Future.delayed(const Duration(seconds: 3), () {
      for (int i = 0; i < state.length; i++) {
        if (state[i].labOrderDate == patientModel.labOrderDate) {
          state[i] = patientModel;
        }
      }
      emit(List.of(state));
      return state;
    });

    return updatedAllPatients;
  }
}
