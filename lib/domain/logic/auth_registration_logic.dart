import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../app/blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../constants/string.dart';
import '../../constants/styles/icons.dart';
import '../user_repository/lib/user_repository.dart';

String? validatorEmail(String? val) {
  if (val!.isEmpty) {
    return 'Пожалуйста, заполните это поле';
  } else if (!emailRexExp.hasMatch(val)) {
    return 'Пожалуйста, введите действительный адрес электронной почты';
  } else {
    return null;
  }
}

String? validatorPassword(String? val) {
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

dynamic displayPassword() {
  obscurePassword = !obscurePassword;
  if (obscurePassword) {
    iconPassword = eysIcon;
  } else {
    iconPassword = eysOffIcon;
  }
}

dynamic passwordVerification({
  String? val,
  required ValueNotifier<bool> containsUpperCase,
  required ValueNotifier<bool> containsLowerCase,
  required ValueNotifier<bool> containsNumber,
  required ValueNotifier<bool> containsSpecialChar,
  required ValueNotifier<bool> contains8Length,
}) {
  containsUpperCase.value = val!.contains(RegExp(r'[A-Z]'));
  containsLowerCase.value = val.contains(RegExp(r'[a-z]'));
  containsNumber.value = val.contains(RegExp(r'[0-9]'));
  containsSpecialChar.value = val.contains(RegExp(r'[!@#\$&*~_-]'));
  contains8Length.value = val.length >= 8;
}

String? validatorName(String? val, {TextEditingController? nameController}) {
  List<String?>? words = val!.trim().split(' ');
  if (val.isEmpty) {
    return 'Пожалуйста, заполните это поле';
  } else if (words.length != 3) {
    return 'Пожалуйста, введите полное имя';
  } else {
    return null;
  }
}

void actionButtonAuth({
  required GlobalKey<FormState> formKey,
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  if (formKey.currentState != null && formKey.currentState!.validate()) {
    context.read<SignInBloc>().add(SignInRequired(
          email: emailController.text,
          password: passwordController.text,
        ));
  }
}

void actionButtonRegistation({
  required GlobalKey<FormState> formKey,
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required TextEditingController nameController,
}) {
  if (formKey.currentState != null && formKey.currentState!.validate()) {
    MyUser myUser = MyUser.empty;
    myUser =
        myUser.copyWith(email: emailController.text, name: nameController.text);
    context
        .read<SignUpBloc>()
        .add(SignUpRequired(user: myUser, password: passwordController.text));
  }
}
