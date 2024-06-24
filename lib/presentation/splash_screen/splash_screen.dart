import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/blocs/auth_bloc/auth_bloc.dart';
import '../../constants/styles/images.dart';
import '../../constants/styles/text_style.dart';

@RoutePage()
class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  String pathForAuth = '';
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      context.router.replaceNamed(pathForAuth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          pathForAuth = '/main';
        } else {
          pathForAuth = '/auth';
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logotip,
                const SizedBox(height: 20),
                const Text('Подача', style: MyTextStyle(fontSize: 40)),
              ],
            ),
          ),
        );
      },
    );
  }
}
