class LabTestModel {
  String labTestName;
  String? labTestResult;

  String? referenceRange;

  LabTestModel({
    required this.labTestName,
    this.labTestResult,
    this.referenceRange,
  });
}
