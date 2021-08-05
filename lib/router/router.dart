import 'package:auto_route/auto_route.dart';
import 'package:basic_template/feature/home/home_screen.dart';
import 'package:basic_template/feature/landing_screen/splash_screen.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    RedirectRoute(path: '/', redirectTo: '/splash'),
    AutoRoute(page: SplashScreen, path: "/splash", initial: true),
    AutoRoute(page: HomeScreen, path: "/home", initial: true),
  ],
)
class $AppRouter {}
