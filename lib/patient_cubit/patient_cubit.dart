import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_app/common_module/common_model/patient_model.dart';

class PatientCubit extends Cubit<List<PatientModel>> {
  PatientCubit() : super([]);

  void addNewPatient(PatientModel patientModel) {
    state.add(patientModel);
    emit(List.of(state));
  }

  void updatePatient(PatientModel patientModel) {
    for (int i = 0; i < state.length; i++) {
      if (state[i].labOrderDate == patientModel.labOrderDate) {
        state[i] = patientModel;
      }
    }
    emit(List.of(state));
  }
}
