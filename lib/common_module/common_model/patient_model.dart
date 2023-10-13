import 'package:hospital_management_app/common_module/common_model/lab_test_model.dart';

class PatientModel {
  String patientName;
  String patientAddress;
  int patientAge;
  LabTestModel labTestModel;
  String? labOrderDate;
  String? labResultDate;

  PatientModel(
      {required this.patientName,
      required this.patientAddress,
      required this.patientAge,
      required this.labTestModel,
      this.labOrderDate,
      this.labResultDate});
}
