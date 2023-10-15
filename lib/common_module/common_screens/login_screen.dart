import 'package:flutter/material.dart';
import 'package:hospital_management_app/common_module/widgets/button_widget.dart';
import 'package:hospital_management_app/doctor_module/view/doctor_home_screen.dart';
import 'package:hospital_management_app/lab_technician_module/lab_technician_home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Welcome to',
                    style: textStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const Text(
                    'Hospital Management App',
                    style: textStyle,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DoctorHomeScreen()));
                      },
                      buttonTitle: 'Log in as Doctor'),
                ),
                ButtonWidget(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LabTechnicianHomeScreen()));
                    },
                    buttonTitle: 'Log in as Lab Technician')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
