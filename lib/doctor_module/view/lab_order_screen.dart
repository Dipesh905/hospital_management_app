import 'package:flutter/material.dart';
import 'package:hospital_management_app/common_module/widgets/button_widget.dart';
import 'package:hospital_management_app/common_module/widgets/input_field_widget.dart';

class LabOrderScreen extends StatelessWidget {
  LabOrderScreen({super.key});

  final TextEditingController _personNameController = TextEditingController();
  final TextEditingController _personAddressController =
      TextEditingController();
  final TextEditingController _personAgeController = TextEditingController();
  final TextEditingController _labTestNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lab Requisition Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InputFieldWidget(
              controller: _personNameController,
              labelText: 'Person Name',
            ),
            InputFieldWidget(
              controller: _personAddressController,
              labelText: 'Person Address',
            ),
            InputFieldWidget(
              controller: _personAgeController,
              labelText: 'Person Age',
            ),
            InputFieldWidget(
              controller: _labTestNameController,
              labelText: 'Lab Test Name',
            ),
            ButtonWidget(
              buttonTitle: 'Create Lab Order',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
