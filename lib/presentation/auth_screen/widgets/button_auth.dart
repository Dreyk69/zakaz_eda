import 'package:flutter/material.dart';

import '../../../domain/logic/auth_registration_logic.dart';

class BottonAuth extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const BottonAuth(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController});

  @override
  State<BottonAuth> createState() => _BottonAuthState();
}

class _BottonAuthState extends State<BottonAuth> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _formKey = widget.formKey;
    _emailController = widget.emailController;
    _passwordController = widget.passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {
          publicFunctionActionForButtonAuth(formKey: _formKey, context: context, emailController: _emailController, passwordController: _passwordController);
        },
        child: const Text('Войти'),
      ),
    );
  }
}
