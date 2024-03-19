import 'package:flutter/material.dart';

class TimePickerTextField extends StatefulWidget {
  final String? label;
  final String? initialValue;
  final Function(String)? onChanged;
  final EdgeInsets? padding;
  final String? Function(String?)? validator; // Validator function added

  const TimePickerTextField({
    Key? key,
    this.label,
    this.initialValue,
    this.onChanged,
    this.padding,
    this.validator, // Validator parameter added
  }) : super(key: key);

  @override
  _TimePickerTextFieldState createState() => _TimePickerTextFieldState();
}

class _TimePickerTextFieldState extends State<TimePickerTextField> {
  final TextEditingController _timeController = TextEditingController();
  late TimeOfDay selectedTime;
  String? errorText; // Store error message

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: _timeController,
      readOnly: true,
      onTap: () {
        _selectTime(context);
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(),
        ),
        suffix: InkWell(
          onTap: () {
            // Clear and invoke onChanged
            _timeController.clear();
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
        labelText: widget.label ?? 'Time',
        suffixIcon: IconButton(
          icon: const Icon(Icons.access_time),
          onPressed: () {
            _selectTime(context);
          },
        ),

        errorText: errorText, // Set error text
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Delay accessing context until after initialization is complete
    Future.delayed(Duration.zero, () {
      // Initialize selectedTime with initial value or TimeOfDay.now()
      selectedTime = widget.initialValue != null
          ? TimeOfDay.fromDateTime(DateTime.parse(widget.initialValue!))
          : TimeOfDay.now();

      // Set the initial value for the text field
      _timeController.text = selectedTime.format(context);
    });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        _timeController.text = pickedTime.format(context);
        // Check validation
      });
      widget.onChanged!(_timeController.text);
    }
  }
}
