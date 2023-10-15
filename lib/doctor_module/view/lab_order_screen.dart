import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hospital_management_app/common_module/common_model/lab_test_model.dart';
import 'package:hospital_management_app/patient_cubit/patient_model.dart';
import 'package:hospital_management_app/common_module/widgets/button_widget.dart';
import 'package:hospital_management_app/common_module/widgets/input_field_widget.dart';
import 'package:hospital_management_app/patient_cubit/patient_cubit.dart';

class LabOrderScreen extends StatelessWidget {
  LabOrderScreen({super.key});

  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _patientAddressController =
      TextEditingController();
  final TextEditingController _patientAgeController = TextEditingController();
  final TextEditingController _labTestNameController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lab Requisition Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InputFieldWidget(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient name';
                  }
                  return null;
                },
                controller: _patientNameController,
                labelText: 'Patient Name',
              ),
              InputFieldWidget(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient address';
                  }
                  return null;
                },
                controller: _patientAddressController,
                labelText: 'Patient Address',
              ),
              InputFieldWidget(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter patient age';
                  } else {
                    final int? parsedValue = int.tryParse(value);

                    if (parsedValue != null) {
                      return null;
                    } else {
                      return 'Only numbers can be used for patient age';
                    }
                  }
                },
                controller: _patientAgeController,
                labelText: 'Patient Age',
              ),
              InputFieldWidget(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter lab test name';
                  }

                  return null;
                },
                controller: _labTestNameController,
                labelText: 'Lab Test Name',
              ),
              ButtonWidget(
                buttonTitle: 'Create Lab Order',
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    try {
                      EasyLoading.show(status: 'Please wait ...');

                      List<PatientModel> allPatients = await context
                          .read<PatientCubit>()
                          .addNewPatient(
                            PatientModel(
                                labOrderDate: DateTime.now().toString(),
                                patientName: _patientNameController.text,
                                patientAddress: _patientAddressController.text,
                                patientAge:
                                    int.parse(_patientAgeController.text),
                                labTestModel: LabTestModel(
                                    labTestName: _labTestNameController.text)),
                          );

                      if (allPatients.isNotEmpty) {
                        if (context.mounted) {
                          EasyLoading.dismiss();
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              backgroundColor: Colors.green,
                              title: Text('Sucess'),
                              content: Text(
                                  'You have sucessfully send patient information to Lab Technician Department'),
                            ),
                          );

                          _patientNameController.clear();
                          _patientAgeController.clear();
                          _patientAddressController.clear();
                          _labTestNameController.clear();
                        }
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                                backgroundColor: Colors.green,
                                title: Text('Please Wait'),
                                content: CircularProgressIndicator()),
                          );
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
                                'Failed to send to Lab Technician Department'),
                          ),
                        );
                      }
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
