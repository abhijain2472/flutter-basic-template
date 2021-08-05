
import 'package:basic_template/app_import.dart';
import 'package:basic_template/feature/landing_screen/store/landing_store.dart';
import 'package:basic_template/router/router.gr.dart';
import 'package:basic_template/widgets/app_gesture_detector.dart';
import 'package:provider/provider.dart';

final appRouter = AppRouter();

/// landing screen class opened when app starts
class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => LandingStore(),
      child: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: () {},
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(
          navigatorObservers: () => [
            // FirebaseAnalyticsObserver(
            //   analytics: appAnalytics,
            //   nameExtractor: (RouteSettings settings) =>
            //       settings.name?.replaceAll("Route", ''),
            // ),
          ],
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.appThemeData(),
        builder: (context, router) {
          return router ?? Container();
        },
      ),
    );
  }

}
