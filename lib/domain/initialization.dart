import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../constants/private_variables.dart';
import '../infrastructure/simple_bloc_observer.dart';

class AppInitializer {
  static final GetIt getIt = GetIt.instance;

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: apiKey,
      appId: appId,
      messagingSenderId: messagingSenderId,
      projectId: projectId,
      storageBucket: storageBucket,
    )
    );
    Bloc.observer = SimpleBlocObserver();
    getIt.registerSingleton<SimpleBlocObserver>(SimpleBlocObserver());
  }
}