import 'package:eda_gotova/app/application.dart';
import 'package:eda_gotova/domain/user_repository/lib/user_repository.dart';
import 'package:flutter/material.dart';

import 'domain/initialization.dart';

void main() async {
  await AppInitializer.initialize();
  runApp(Application(FirebaseUserRepository(),));
}
