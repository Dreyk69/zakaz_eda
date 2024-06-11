import 'package:auto_route/auto_route.dart';

import '../../../presentation/auth_screen/auth_screen.dart';
import '../../../presentation/main_screen/main_screen.dart';
import '../../../presentation/main_screen/screen/home_screen/home_screen.dart';
import '../../../presentation/main_screen/screen/info_screen/info_screen.dart';
import '../../../presentation/main_screen/screen/order_screen/order_screen.dart';
import '../../../presentation/main_screen/screen/profile_screen/profile_screen.dart';
import '../../../presentation/registration_screen/registration_screen.dart';
import '../../../presentation/splash_screen/splash_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplachRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: AuthRoute.page,
          path: '/auth',
        ),
        AutoRoute(
          page: RegistrationRoute.page,
          path: '/registration',
        ),
        AutoRoute(page: MainRoute.page, path: '/main', children: [
          AutoRoute(
            page: HomeRoute.page,
            path: 'home',
          ),
          AutoRoute(
            page: InfoRoute.page,
            path: 'info',
          ),
          AutoRoute(
            page: OrderRoute.page,
            path: 'order',
          ),
          AutoRoute(
            page: ProfileRoute.page,
            path: 'profile',
          ),
        ]),
      ];
}
