import 'package:flutter/material.dart';

import '../../constants/styles/icons.dart';
import '../../constants/styles/styles_text_field.dart';
import '../../domain/logic/auth_registration_logic.dart';

class TextFieldEmail extends StatefulWidget {
  final TextEditingController _emailController;
  const TextFieldEmail(
      {super.key, required TextEditingController emailController})
      : _emailController = emailController;

  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget._emailController,
        textInputAction: TextInputAction.next,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        validator: (val) => validatorEmail(val),
        decoration: StylesTextField(
          hintText: 'Введите Email',
          prefixIcon: emailIcon,
        ));
  }
}
