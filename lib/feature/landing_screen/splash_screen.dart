
import 'package:basic_template/common/app_widget/app_error_widget.dart';
import 'package:basic_template/feature/landing_screen/store/landing_store.dart';
import 'package:basic_template/services/network/enum/store_enum.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../app_import.dart';

/// splash screen used to display app icon while initially data is loaded
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LandingStore? _landingStore;

  @override
  void initState() {
    Utility.statusBarColorPrimaryBackGround();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_landingStore == null) {
      _landingStore = Provider.of<LandingStore>(context);
      // Future.delayed(Duration(seconds: 3))
      //     .then((value) => appRouter.replace(OnBoardRoute()));
      _landingStore!.runLandingLogic(context);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Utility.statusBarColorWhiteBackGround();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primary,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                // child: Image.asset(
                //   AppAssets.splash_logo,
                // ),
                child: FlutterLogo(),
              ),
            ],
          ),
        ),
        Observer(
          builder: (context) {
            if (_landingStore!.state == UIState.busy ||
                _landingStore!.state == UIState.loading) {
              // return BusyStateWidget(
              //   state: _landingStore!.state,
              //   showProgressIndicator: _landingStore!.state == UIState.loading,
              // );
              return SizedBox.shrink();
            } else if (_landingStore!.state == UIState.free) {
              return SizedBox.shrink();
            } else if (_landingStore!.state == UIState.error) {
              return AppErrorWidget(
                errorMessage: _landingStore!.errorMessage,
                uiState: _landingStore!.state,
                onFinish: _landingStore!.resetUIState,
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
