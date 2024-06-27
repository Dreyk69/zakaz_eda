import 'package:auto_route/auto_route.dart';
import 'package:eda_gotova/constants/styles/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/blocs/auth_bloc/auth_bloc.dart';
import '../../app/blocs/sign_in_bloc/sign_in_bloc.dart';

import 'widgets/button_auth.dart';
import 'widgets/button_navigator.dart';
import '../widgets/text_field_email.dart';
import 'widgets/text_field_password_auth.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) =>
          SignInBloc(myUserRepository: context.read<AuthBloc>().userRepository),
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            context.router.replaceNamed('/main');
          }
        },
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return Scaffold(
              body: Center(
                  child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        logotip,
                        const SizedBox(height: 10),
                        TextFieldEmail(
                          emailController: _emailController,
                        ),
                        const SizedBox(height: 15),
                        TextFieldPasswordAuth(
                          passwordController: _passwordController,
                          errorMsg: state is SignInFailure
                              ? 'Неправильный адрес электронной почты или пароль'
                              : null,
                        ),
                        const SizedBox(height: 15),
                        state is SignInProcess
                            ? const CircularProgressIndicator()
                            : Column(
                                children: [
                                  BottonAuth(
                                    formKey: _formKey,
                                    emailController: _emailController,
                                    passwordController: _passwordController,
                                  ),
                                  const SizedBox(height: 10),
                                  const ButtonNavigator(),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              )),
            );
          },
        ),
      ),
    );
  }
}
