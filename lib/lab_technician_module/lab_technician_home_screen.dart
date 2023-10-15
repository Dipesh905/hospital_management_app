import 'package:flutter/material.dart';
import 'package:hospital_management_app/common_module/widgets/button_widget.dart';
import 'package:hospital_management_app/lab_technician_module/lab_report_screen.dart';

class LabTechnicianHomeScreen extends StatelessWidget {
  const LabTechnicianHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged in as Lab Technician'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LabReportScreen()));
                },
                buttonTitle: 'View Lab Reports')
          ],
        ),
      ),
    );
  }
}
