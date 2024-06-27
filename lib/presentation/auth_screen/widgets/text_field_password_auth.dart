import 'package:flutter/material.dart';

import '../../../constants/styles/icons.dart';
import '../../../constants/styles/styles_text_field.dart';
import '../../../domain/logic/auth_registration_logic.dart';

class TextFieldPasswordAuth extends StatefulWidget {
  final TextEditingController _passwordController;
  final String? _errorMsg;
  const TextFieldPasswordAuth({
    super.key,
    required TextEditingController passwordController,
    String? errorMsg,
  })  : _passwordController = passwordController,
        _errorMsg = errorMsg;

  @override
  State<TextFieldPasswordAuth> createState() => _TextFieldPasswordAuthState();
}

class _TextFieldPasswordAuthState extends State<TextFieldPasswordAuth> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._passwordController,
      obscureText: obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      validator: (val) => validatorPassword(val),
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

// TextFormField(
//                           controller: passwordController,
//                           obscureText: obscurePassword,
//                           keyboardType: TextInputType.visiblePassword,
//                           validator: (val) {
//                             return validatorForPassword(val);
//                           },
//                           onChanged: (val) {
//                             setState(() {
//                               passwordVerification(val);
//                             });
//                             // return null;
//                           },
//                           decoration: StylesTextField(
//                             hintText: 'Введите пароль',
//                             prefixIcon: passwordIcon,
//                             errorText: _errorMsgForPassword,
//                             suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   passwordDisplay();
//                                 });
//                               },
//                               icon: Icon(iconPassword),
//                             ),
//                           ),
//                         ),
