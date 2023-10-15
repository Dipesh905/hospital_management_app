import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hospital_management_app/common_module/common_model/lab_test_model.dart';
import 'package:hospital_management_app/patient_cubit/patient_model.dart';
import 'package:hospital_management_app/common_module/widgets/button_widget.dart';
import 'package:hospital_management_app/common_module/widgets/input_field_widget.dart';
import 'package:hospital_management_app/patient_cubit/patient_cubit.dart';

class LabReportDetailScreen extends StatelessWidget {
  const LabReportDetailScreen({required this.patientModel, super.key});

  final PatientModel patientModel;

  @override
  Widget build(BuildContext context) {
    final TextEditingController testResultController =
        TextEditingController(text: patientModel.labTestModel.labTestResult);
    final TextEditingController referenceResultController =
        TextEditingController(text: patientModel.labTestModel.referenceRange);
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Report Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Patient Name:${patientModel.patientName}'),
              Text('Patient Address:${patientModel.patientAddress}'),
              Text('Patient Age:${patientModel.patientAge}'),
              Text('Lab Test Name:${patientModel.labTestModel.labTestName}'),
              Text('Order Date:${patientModel.labOrderDate}'),
              if (patientModel.labResultDate != null ||
                  patientModel.labTestModel.labTestResult != null ||
                  patientModel.labTestModel.referenceRange != null) ...{
                Text('Lab Result Date:${patientModel.labResultDate}'),
                Text('Lab Result:${patientModel.labTestModel.labTestResult}'),
                Text(
                    'Reference Range:${patientModel.labTestModel.referenceRange}'),
              } else ...{
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: InputFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter test result';
                      }
                      return null;
                    },
                    controller: testResultController,
                    labelText: 'Test Result',
                  ),
                ),
                InputFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter reference result';
                    }
                    return null;
                  },
                  controller: referenceResultController,
                  labelText: 'Reference Result',
                ),
                ButtonWidget(
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        EasyLoading.show(status: 'Please wait ...');

                        try {
                          List<PatientModel> updatedList = await context
                              .read<PatientCubit>()
                              .updatePatient(
                                PatientModel(
                                  labResultDate: DateTime.now().toString(),
                                  labOrderDate: patientModel.labOrderDate,
                                  patientName: patientModel.patientName,
                                  patientAddress: patientModel.patientAddress,
                                  patientAge: patientModel.patientAge,
                                  labTestModel: LabTestModel(
                                      labTestName:
                                          patientModel.labTestModel.labTestName,
                                      labTestResult: testResultController.text,
                                      referenceRange:
                                          referenceResultController.text),
                                ),
                              );

                          if (updatedList.isNotEmpty) {
                            if (context.mounted) {
                              EasyLoading.dismiss();
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  backgroundColor: Colors.green,
                                  title: Text('Sucess'),
                                  content: Text(
                                      'You have sucessfully update patient report and send to Doctor'),
                                ),
                              );

                              testResultController.clear();
                              referenceResultController.clear();
                            }
                          }
                        } catch (e) {
                          if (context.mounted) {
                            EasyLoading.dismiss();
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                backgroundColor: Colors.red,
                                title: Text('Failed'),
                                content: Text(
                                    'Failed to send to Doctor, Please try again'),
                              ),
                            );
                          }
                        }
                      }
                    },
                    buttonTitle: 'Submit to doctor')
              }
            ],
          ),
        ),
      ),
    );
  }
}
