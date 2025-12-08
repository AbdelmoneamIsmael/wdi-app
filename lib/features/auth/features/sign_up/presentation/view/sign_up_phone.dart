import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wdi/core/extension/strings_extention.dart';
import 'package:wdi/core/widgets/app_drop_down.dart';
import 'package:wdi/core/widgets/app_text_field.dart';

class SignUpPhone extends StatelessWidget {
  const SignUpPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        AppDropDown(
          title: 'Country Code',
          items: const [
            DropdownMenuItem(value: '971', child: Text('+971 (UAE)')),
            DropdownMenuItem(value: '966', child: Text('+966 (Saudi Arabia)')),
            DropdownMenuItem(value: '20', child: Text('+20 (Egypt)')),
            DropdownMenuItem(value: '974', child: Text('+974 (Qatar)')),
            DropdownMenuItem(value: '973', child: Text('+973 (Bahrain)')),
            DropdownMenuItem(value: '965', child: Text('+965 (Kuwait)')),
            DropdownMenuItem(value: '968', child: Text('+968 (Oman)')),
          ],
          initialValue: '971',
          onChanged: (value) {},
        ),
        const AppTextFieldWithTitle(title: 'Phone Number', hint: '50 123 4567'),
        ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: 'Verify'.toText(),
        ),
      ],
    );
  }
}
