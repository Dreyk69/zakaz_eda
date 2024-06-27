import 'package:flutter/material.dart';

import '../../../constants/styles/icons.dart';
import '../../../constants/styles/styles_text_field.dart';
import '../../../domain/logic/auth_registration_logic.dart';

class TextFieldPasswordReg extends StatefulWidget {
  final TextEditingController _passwordController;
  final String? _errorMsg;
  final ValueNotifier<bool> _containsUpperCase;
  final ValueNotifier<bool> _containsLowerCase;
  final ValueNotifier<bool> _containsNumber;
  final ValueNotifier<bool> _containsSpecialChar;
  final ValueNotifier<bool> _contains8Length;

  const TextFieldPasswordReg({
    super.key,
    required TextEditingController passwordController,
    String? errorMsg,
    required ValueNotifier<bool> containsUpperCase,
    required ValueNotifier<bool> containsLowerCase,
    required ValueNotifier<bool> containsNumber,
    required ValueNotifier<bool> containsSpecialChar,
    required ValueNotifier<bool> contains8Length,
  })  : _passwordController = passwordController,
        _errorMsg = errorMsg,
        _containsUpperCase = containsUpperCase,
        _containsLowerCase = containsLowerCase,
        _containsNumber = containsNumber,
        _containsSpecialChar = containsSpecialChar,
        _contains8Length = contains8Length;

  @override
  State<TextFieldPasswordReg> createState() => _TextFieldPasswordRegState();
}

class _TextFieldPasswordRegState extends State<TextFieldPasswordReg> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._passwordController,
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      validator: (val) => validatorPassword(val),
      onChanged: (val) => setState(() {
        passwordVerification(
          val: val,
          containsUpperCase: widget._containsUpperCase,
          containsLowerCase: widget._containsLowerCase,
          containsNumber: widget._containsNumber,
          containsSpecialChar: widget._containsSpecialChar,
          contains8Length: widget._contains8Length,
        );
      }),
      decoration: StylesTextField(
          hintText: 'Введите пароль',
          prefixIcon: passwordIcon,
          errorText: widget._errorMsg,
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              displayPassword();
            }),
            icon: Icon(iconPassword),
          )),
    );
  }
}
