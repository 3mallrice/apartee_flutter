import 'package:flutter/material.dart';

class MyComboBox extends StatelessWidget {
  const MyComboBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: const <DropdownMenuItem<String>>[
        DropdownMenuItem(
          value: 'option1',
          child: Text('Option 1'),
        ),
        DropdownMenuItem(
          value: 'option2',
          child: Text('Option 2'),
        ),
        DropdownMenuItem(
          value: 'option3',
          child: Text('Option 3'),
        ),
      ],
      onChanged: (String? selectedValue) {
        // Handle the selected value here
      },
    );
  }
}
