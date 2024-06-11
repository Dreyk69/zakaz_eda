import 'package:eda_gotova/constants/styles/colors.dart';
import 'package:eda_gotova/infrastructure/navigation_service/router/router.dart';
import 'package:flutter/material.dart';

class ApplicationView extends StatefulWidget {
  const ApplicationView({super.key});

  @override
  State<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: mainColor,
          scaffoldBackgroundColor: backgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
          useMaterial3: true),
      routerConfig: _router.config(),
    );
  }
}
