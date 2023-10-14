import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_app/common_module/common_model/patient_model.dart';
import 'package:hospital_management_app/lab_technician_module/lab_report_detail_screen.dart';
import 'package:hospital_management_app/patient_cubit/patient_cubit.dart';

class LabReportScreen extends StatelessWidget {
  const LabReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Report'),
      ),
      body: BlocBuilder<PatientCubit, List<PatientModel>>(
        builder: (context, state) => state.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LabReportDetailScreen(
                          patientModel: state[index],
                        ),
                      ),
                    ),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text('Name: ${state[index].patientName}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Age: ${state[index].patientAge}'),
                            Text('Order Date:${state[index].labOrderDate}'),
                            if (state[index].labResultDate != null) ...{
                              Text(
                                  'Lab Result  Date: ${state[index].labResultDate!}'),
                              const Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text('Lab Test Completed'),
                                  ),
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                ],
                              )
                            }
                          ],
                        ),
                        trailing: Text(state[index].labTestModel.labTestName),
                      ),
                    ),
                  );
                },
              )
            : const Center(child: Text('Empty')),
      ),
    );
  }
}
