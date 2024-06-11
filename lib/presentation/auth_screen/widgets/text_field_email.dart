import 'package:flutter/material.dart';

import '../../../constants/styles/icons.dart';
import '../../../constants/styles/styles_text_field.dart';
import '../../../domain/logic/auth_registration_logic.dart';

class TextFieldEmail extends StatefulWidget {
  const TextFieldEmail({super.key});

  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
  final emailController = TextEditingController();
  String? _errorMsgForEmail;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: emailController,
        textInputAction: TextInputAction.next,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          return validatorForEmail(val);
        },
        decoration: StylesTextField(
          hintText: 'Введите Email',
          prefixIcon: emailIcon,
          errorText: _errorMsgForEmail,
        ));
  }
}
