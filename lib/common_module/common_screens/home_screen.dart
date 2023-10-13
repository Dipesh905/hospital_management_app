import 'package:flutter/material.dart';
import 'package:hospital_management_app/common_module/widgets/button_widget.dart';
import 'package:hospital_management_app/doctor_module/view/lab_order_screen.dart';
import 'package:hospital_management_app/lab_technician_module/lab_report_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hospital Management App'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LabOrderScreen()));
                  },
                  buttonTitle: 'Create Requistion Form'),
            ),
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
