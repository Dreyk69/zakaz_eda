import 'package:flutter/material.dart';

import '../../../constants/styles/icons.dart';
import '../../../constants/styles/styles_text_field.dart';
import '../../../domain/logic/auth_registration_logic.dart';

class TextFieldName extends StatefulWidget {
  final TextEditingController _nameController;
  const TextFieldName(
      {super.key, required TextEditingController nameController})
      : _nameController = nameController;

  @override
  State<TextFieldName> createState() => _TextFieldNameState();
}

class _TextFieldNameState extends State<TextFieldName> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget._nameController,
        textInputAction: TextInputAction.next,
        autocorrect: false,
        keyboardType: TextInputType.name,
        validator: (val) =>
            validatorName(val, nameController: widget._nameController),
        decoration: StylesTextField(
          hintText: 'Введите ФИО',
          prefixIcon: nameIcon,
        ));
  }
}
