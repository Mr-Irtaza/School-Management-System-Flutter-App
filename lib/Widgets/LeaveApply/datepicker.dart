import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged; // Changed to ValueChanged<String>
  final FormFieldSetter<String>? onSaved; // Changed to FormFieldSetter<String>
  final FormFieldValidator<String>? validator; // Changed to FormFieldValidator<String>
  final String title;

  CustomDatePicker({
    required this.controller,
    this.onChanged,
    this.onSaved,
    this.validator,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      type: DateTimePickerType.date,
      dateMask: 'dd/MM/yyyy',
      controller: controller,
      //initialValue: _initialValue,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      calendarTitle: "${title}",
      confirmText: "Confirm",
      enableSuggestions: true,
      //locale: Locale('en', 'US'),
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
