import 'package:hospital_management_app/common_module/common_model/patient_model.dart';

class PatientState {
  List<PatientModel> allPatients = [];

  PatientState({required this.allPatients});
}

class InitialPatientState extends PatientState {
  InitialPatientState() : super(allPatients: []);
}

class AddPatientState extends PatientState {
  AddPatientState(PatientModel patientModel)
      : super(allPatients: [patientModel]);
}
