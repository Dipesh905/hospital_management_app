/// LabTestModel
class LabTestModel {
  /// Name of test that needs to be done for a patient
  String labTestName;

  /// result obtained after doing test by lab technician
  String? labTestResult;

  /// reference values of currently done test
  String? referenceRange;

  LabTestModel({
    required this.labTestName,
    this.labTestResult,
    this.referenceRange,
  });
}
