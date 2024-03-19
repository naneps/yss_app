import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerTextField extends StatefulWidget {
  String? label;
  String? initialValue;
  Function(String)? onChanged;
  EdgeInsets? padding;
  String Function(String?)? validator; // Validator function added
  DatePickerTextField({
    super.key,
    this.label,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.padding,
  });
  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  final TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: _dateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(),
        ),
        suffix: InkWell(
          onTap: () {
            // clear an on change
            _dateController.clear();
            widget.onChanged!('');
          },
          child: const Icon(
            Icons.close,
            size: 15,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(),
        ),
        contentPadding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        labelText: widget.label ?? 'Date',
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () {
            _selectDate(context);
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Get.theme.primaryColor,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: ColorScheme.light(primary: Get.theme.primaryColor)
                .copyWith(secondary: Get.theme.primaryColor),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
      widget.onChanged!(_dateController.text);
    }
  }
}
