import 'package:auto_route/auto_route.dart';
import 'package:eda_gotova/constants/styles/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/blocs/auth_bloc/auth_bloc.dart';
import '../../app/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../constants/styles/icons.dart';
import '../../constants/styles/styles_text_field.dart';
import '../../domain/logic/auth_registration_logic.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  String? _errorMsgForEmail;
  final passwordController = TextEditingController();
  String? _errorMsgForPassword;
  final _formKey = GlobalKey<FormState>();
  late final SignInBloc _signInBloc;
  bool _signInRequired = false;
  @override
  void initState() {
    super.initState();
    _signInBloc =
        SignInBloc(myUserRepository: context.read<AuthBloc>().userRepository);
  }

  @override
  void dispose() {
    _signInBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => _signInBloc,
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInInitial ||
              state is SignInSuccess ||
              state is SignInProcess ||
              state is SignInFailure) {
            if (state is SignInInitial) {
              _signInRequired = false;
            } else if (state is SignInSuccess) {
              _signInRequired = false;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.router.replaceNamed('/main');
              });
            } else if (state is SignInProcess) {
              _signInRequired = true;
            } else if (state is SignInFailure) {
              _signInRequired = false;
              _errorMsgForPassword =
                  'Неправильный адрес электронной почты или пароль';
            }
          }
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
                      TextFormField(
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
                          )),
                      const SizedBox(height: 15),
                      TextFormField(
                        controller: passwordController,
                        obscureText: obscurePassword,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (val) {
                          return validatorForPassword(val);
                        },
                        decoration: StylesTextField(
                            hintText: 'Введите пароль',
                            prefixIcon: passwordIcon,
                            errorText: _errorMsgForPassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordDisplay();
                                });
                              },
                              icon: Icon(iconPassword),
                            )),
                      ),
                      const SizedBox(height: 15),
                      !_signInRequired
                          ? Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: FilledButton(
                                    onPressed: () {
                                      if (_formKey.currentState != null &&
                                          _formKey.currentState!.validate()) {
                                        context
                                            .read<SignInBloc>()
                                            .add(SignInRequired(
                                              emailController.text,
                                              passwordController.text,
                                            ));
                                      }
                                    },
                                    child: const Text('Войти'),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: FilledButton(
                                    onPressed: () {
                                      context.router.replaceNamed('/registration');
                                    },
                                    child: const Text('Регистрация'),
                                  ),
                                ),
                              ],
                            )
                          : const CircularProgressIndicator()
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
