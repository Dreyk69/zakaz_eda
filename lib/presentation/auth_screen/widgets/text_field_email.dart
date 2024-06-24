import 'package:flutter/material.dart';

import '../../../constants/styles/icons.dart';
import '../../../constants/styles/styles_text_field.dart';
import '../../../domain/logic/auth_registration_logic.dart';

class TextFieldEmail extends StatefulWidget {
  final TextEditingController emailController;
  const TextFieldEmail({super.key, required this.emailController});

  @override
  State<TextFieldEmail> createState() => _TextFieldEmailState();
}

class _TextFieldEmailState extends State<TextFieldEmail> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = widget.emailController;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _emailController,
        textInputAction: TextInputAction.next,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          return validatorForEmail(val);
        },
        decoration: StylesTextField(
          hintText: 'Введите Email',
          prefixIcon: emailIcon,
        ));
  }
}
