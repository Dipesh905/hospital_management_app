import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_management_app/patient_bloc/patient_bloc.dart';
import 'package:hospital_management_app/patient_bloc/patient_state.dart';

class LabReportScreen extends StatelessWidget {
  const LabReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Report'),
      ),
      body: BlocBuilder<PatientBloc, PatientState>(
        builder: (context, state) {
          return state.allPatients.isNotEmpty
              ? ListView.builder(
                  itemCount: state.allPatients.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(state.allPatients[index].patientName),
                      subtitle: Text(
                          state.allPatients[index].labTestModel.labTestName),
                    );
                  },
                )
              : const Center(child: Text('Empty'));
        },
      ),
    );
  }
}
