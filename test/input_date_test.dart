import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yss_app/app/common/ui/input/input_date.dart';

void main() {
  group('DatePickerTextField', () {
    late TextEditingController controller;
    late Function(String) onChanged;
    late String Function(String?)? validator;

    setUp(() {
      controller = TextEditingController();
      onChanged = (value) {};
      validator = (value) => value!.isEmpty ? 'Please enter a date' : '';
    });

    testWidgets('Initial value is set correctly', (WidgetTester tester) async {
      const initialValue = '2022-01-01';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DatePickerTextField(
              initialValue: initialValue,
              onChanged: onChanged,
              validator: validator,
            ),
          ),
        ),
      );

      expect(find.text(initialValue), findsOneWidget);
    });

    testWidgets('Clear button clears the text field',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DatePickerTextField(
              onChanged: onChanged,
              validator: validator,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(controller.text, '');
    });

    testWidgets('Selecting a date updates the text field',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DatePickerTextField(
              onChanged: onChanged,
              validator: validator,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.calendar_today));
      await tester.pumpAndSettle();

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      expect(controller.text.isNotEmpty, true);
    });

    testWidgets('Validation error is shown when date is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DatePickerTextField(
              onChanged: onChanged,
              validator: validator,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Save'));
      await tester.pump();

      expect(find.text('Please enter a date'), findsOneWidget);
    });
  });
}
