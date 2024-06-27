import 'package:flutter/material.dart';

import '../../../domain/logic/auth_registration_logic.dart';

class BottonAuth extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  const BottonAuth(
      {super.key,
      required GlobalKey<FormState> formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController})
      : _formKey = formKey, _emailController = emailController, _passwordController = passwordController;

  @override
  State<BottonAuth> createState() => _BottonAuthState();
}

class _BottonAuthState extends State<BottonAuth> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () => actionButtonAuth(
            formKey: widget._formKey,
            context: context,
            emailController: widget._emailController,
            passwordController: widget._passwordController),
        child: const Text('Войти'),
      ),
    );
  }
}
