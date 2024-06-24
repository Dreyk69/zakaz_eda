import 'package:flutter/material.dart';

import '../../../constants/styles/icons.dart';
import '../../../constants/styles/styles_text_field.dart';
import '../../../domain/logic/auth_registration_logic.dart';

class TextFieldPassword extends StatefulWidget {
  final TextEditingController passwordController;
  final String? errorMsg;
  const TextFieldPassword(
      {super.key, required this.passwordController, this.errorMsg});

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  late final TextEditingController _passwordController;
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _passwordController = widget.passwordController;
  }

  @override
  Widget build(BuildContext context) {
    _errorMsg = widget.errorMsg;
    return TextFormField(
      controller: _passwordController,
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      validator: (val) {
        return validatorForPassword(val);
      },
      decoration: StylesTextField(
          hintText: 'Введите пароль',
          prefixIcon: passwordIcon,
          errorText: _errorMsg,
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
