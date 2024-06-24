import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../constants/string.dart';
import '../../constants/styles/icons.dart';

String? validatorForEmail(String? val) {
  if (val!.isEmpty) {
    return 'Пожалуйста, заполните это поле';
  } else if (!emailRexExp.hasMatch(val)) {
    return 'Пожалуйста, введите действительный адрес электронной почты';
  } else {
    return null;
  }
}

String? validatorForPassword(String? val) {
  if (val!.isEmpty) {
    return 'Пожалуйста, заполните это поле';
  } else if (!passwordRexExp.hasMatch(val)) {
    return 'Пожалуйста, введите действительный пароль';
  } else {
    return null;
  }
}

bool obscurePassword = true;
IconData iconPassword = eysIcon;

dynamic passwordDisplay() {
  obscurePassword = !obscurePassword;
  if (obscurePassword) {
    iconPassword = eysIcon;
  } else {
    iconPassword = eysOffIcon;
  }
}

bool containsUpperCase = false;
bool containsLowerCase = false;
bool containsNumber = false;
bool containsSpecialChar = false;
bool contains8Length = false;

dynamic passwordVerification(String? val) {
  if (val!.contains(RegExp(r'[A-Z]'))) {
    containsUpperCase = true;
  } else {
    containsUpperCase = false;
  }
  if (val.contains(RegExp(r'[a-z]'))) {
    containsLowerCase = true;
  } else {
    containsLowerCase = false;
  }
  if (val.contains(RegExp(r'[0-9]'))) {
    containsNumber = true;
  } else {
    containsNumber = false;
  }
  if (val.contains(specialCharRexExp)) {
    containsSpecialChar = true;
  } else {
    containsSpecialChar = false;
  }
  if (val.length >= 8) {
    contains8Length = true;
  } else {
    contains8Length = false;
  }
}

String? validatorForName(String? val, {TextEditingController? nameController}) {
  List<String?>? words = val!.trim().split(' ');
  if (val.isEmpty) {
    return 'Пожалуйста, заполните это поле';
  } else if (words.length != 3) {
    return 'Пожалуйста, введите полное имя';
  } else {
    return null;
  }
}

late final GlobalKey<FormState> _formKey;
late final TextEditingController _emailController;
late final TextEditingController _passwordController;

void _actionForButtonAuth({
  required GlobalKey<FormState> formKey,
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  _formKey = formKey;
  _emailController = emailController;
  _passwordController = passwordController;
  if (_formKey.currentState != null && _formKey.currentState!.validate()) {
    context.read<SignInBloc>().add(SignInRequired(
          email: _emailController.text,
          password: _passwordController.text,
        ));
  }
}

void publicFunctionActionForButtonAuth({
  required GlobalKey<FormState> formKey,
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  _actionForButtonAuth(
      formKey: formKey,
      context: context,
      emailController: emailController,
      passwordController: passwordController);
}
