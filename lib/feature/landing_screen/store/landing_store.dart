import 'dart:io';

import 'package:basic_template/feature/landing_screen/landing_screen.dart';
import 'package:basic_template/router/router.gr.dart';
import 'package:basic_template/services/local_hive/PrefBox.dart';
import 'package:basic_template/services/network/api_provider.dart';
import 'package:basic_template/services/network/enum/store_enum.dart';
import 'package:basic_template/services/network/exceptions/exceptions.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../app_import.dart';

part 'landing_store.g.dart';

class LandingStore = _LandingStore with _$LandingStore;

abstract class _LandingStore with Store {
  APIProviderIml _apiManager = GetIt.I.get<APIProviderIml>();

  @observable
  UIState state = UIState.free;

  @observable
  String errorMessage = "";

  @action
  void resetUIState({
    UIState state = UIState.free,
    String errMsg = '',
  }) {
    this.state = state;
    this.errorMessage = errMsg;
    Utility.log("UI State Reset");
  }

  @action
  Future<void> runLandingLogic(
    BuildContext context,
  ) async {
    this.errorMessage = '';
    var result;

    try {
      if (GetIt.I.get<PrefBox>().isLogin) {
        // if user is logged in then call api to get full user payload

      } else {
        // if not logged in then just made one api call for check if data is connected or not..
        // result = await _apiManager.checkDataConnection();
      }
    } on BadNetworkException {
      this.errorMessage = (AppStrings.badNetworkErrorMsg);
    } on InternalServerException {
      this.errorMessage = (AppStrings.internalServerErrorMsg);
    } on ApiErrorMessageException {
      this.errorMessage = (AppStrings.badResponseErrorMsg);
    } on UnauthenticatedException {
      this.errorMessage = (AppStrings.unauthenticatedErrorMsg);
    } on ApiException catch (error) {
      this.errorMessage = (error.errorMessage!);
    } catch (error) {
      Utility.log('COMMON ERROR MSG : $error');
      this.errorMessage = (AppStrings.commonErrorMsg);
    } finally {
      this.state = UIState.free;
      if (this.errorMessage != '') {
        this.state = UIState.error;
        Utility.log("$errorMessage");
      } else {
        if (GetIt.I.get<PrefBox>().isLogin) {
          Future.delayed(Duration(seconds: 2)).then((_) {
            appRouter.push(HomeRoute());
          });
        } else {
          Future.delayed(Duration(seconds: 2)).then((_) {
            appRouter.replace(HomeRoute());
          });
        }
      }
    }
  }
}
