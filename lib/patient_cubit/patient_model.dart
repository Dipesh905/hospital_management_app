import 'package:hospital_management_app/common_module/common_model/lab_test_model.dart';

/// PatientModel
class PatientModel {
  /// name of patient
  String patientName;

  /// address of patients
  String patientAddress;

  /// current age of patient
  int patientAge;

  /// LabTestModel
  ///
  /// it includes labtestName, Lab result and reference result
  LabTestModel labTestModel;

  /// Patient Created Date
  String? labOrderDate;

  /// Date on which patient testing results are obtained
  String? labResultDate;

  PatientModel(
      {required this.patientName,
      required this.patientAddress,
      required this.patientAge,
      required this.labTestModel,
      this.labOrderDate,
      this.labResultDate});
}
