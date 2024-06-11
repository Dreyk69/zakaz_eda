import 'package:flutter/material.dart';

import '../../../constants/styles/icons.dart';
import '../../../constants/styles/styles_text_field.dart';
import '../../../domain/logic/auth_registration_logic.dart';

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({super.key});

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  final passwordController = TextEditingController();
  String? _errorMsgForPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      validator: (val) {
        return validatorForPassword(val);
      },
      decoration: StylesTextField(
          hintText: 'Введите пароль',
          prefixIcon: passwordIcon,
          errorText: _errorMsgForPassword,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordDisplay();
              });
            },
            icon: Icon(iconPassword),
          )),
    );
  }
}
