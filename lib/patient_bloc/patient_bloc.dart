import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_app/common_module/common_model/lab_test_model.dart';
import 'package:hospital_management_app/common_module/common_model/patient_model.dart';
import 'package:hospital_management_app/patient_bloc/patient_event.dart';
import 'package:hospital_management_app/patient_bloc/patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  PatientBloc() : super(InitialPatientState()) {
    on<AddPatientsEvent>(
      (event, emit) => emit(
        AddPatientState(
          PatientModel(
            patientName: 'patientName',
            patientAddress: 'patientAddress',
            patientAge: 20,
            labTestModel: LabTestModel(labTestName: 'labTestName'),
          ),
        ),
      ),
    );
  }
}
