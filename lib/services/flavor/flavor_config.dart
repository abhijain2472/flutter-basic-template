
import 'package:basic_template/common/themes/app_strings.dart';

enum MyEnvironments { prod, dev, test }

/// flavour configuration class used to generate apk in different flavour
class FlavorConfig {
  /// Define your required variables
  final MyEnvironments environment;
  final String baseUrl;
  final String backOfficeUrl;
  final String googleAPIKey;
  final String firebaseWebAPIKey;
  final bool isProdEnvironment;

  static FlavorConfig? _instance;

  FlavorConfig._internal(
    this.environment,
    this.baseUrl,
    this.backOfficeUrl,
    this.googleAPIKey,
    this.firebaseWebAPIKey,
    this.isProdEnvironment,
  );

  static FlavorConfig get instance => _instance!;

  /// Factor flavor class
  factory FlavorConfig({
    MyEnvironments environment: MyEnvironments.test,
    required String baseUrl,
    required String backOfficeUrl,
    required String googleAPIKey,
    required String firebaseWebAPIKey,
    bool? isProdEnvironment,
  }) {
    _instance ??= FlavorConfig._internal(
      environment,
      baseUrl,
      backOfficeUrl,
      googleAPIKey,
      firebaseWebAPIKey,
      isProdEnvironment = false,
    );

    return _instance!;
  }

  static void setUpFlavor(
      {MyEnvironments defaultEnvironment = MyEnvironments.dev}) {
    /// Getter for flavor environment
    MyEnvironments? getFlavorEnvironment() {
      /// Read variable from environment
      const environment = String.fromEnvironment('env');

      switch (environment) {
        case "test":
          return MyEnvironments.test;
        case "prod":
          return MyEnvironments.prod;
        case "dev":
          return MyEnvironments.dev;
        default:
          return null;
      }
    }

    /// Getter for base URL
    String getBaseUrl(MyEnvironments environment) {

      switch (environment) {
        case MyEnvironments.prod:
          return AppStrings.prodBaseURL;

        case MyEnvironments.dev:
          return AppStrings.devBaseURL;

        case MyEnvironments.test:
          return AppStrings.testBaseURL;
      }
      return AppStrings.prodBaseURL;
    }

    /// Getter for base URL
    String getBackOfficeUrl(MyEnvironments environment) {
      switch (environment) {
        case MyEnvironments.prod:
          return AppStrings.prodBackOfficeURL;

        case MyEnvironments.dev:
          return AppStrings.devBackOfficeURL;

        case MyEnvironments.test:
          return AppStrings.testBackOfficeURL;
      }
      return AppStrings.devBackOfficeURL;
    }

    /// for check when environment is production
    bool checkEnvironment(MyEnvironments environment) {
      switch (environment) {
        case MyEnvironments.prod:
          return true;

        case MyEnvironments.dev:
          return false;

        case MyEnvironments.test:
          return false;
      }
      return true;
    }

    /// Getter for base URL
    String getGoogleAPIKey(MyEnvironments environment) {
      switch (environment) {
        case MyEnvironments.prod:
          return "";

        case MyEnvironments.dev:
          return "";

        case MyEnvironments.test:
          return "";
      }
      return "AIzaSyAk26J6hSrlvnFrtUvkDLf7uffzFvZ4qW4";
    }

    /// Getter for FirebaseWebAPI Key
    String getFirebaseWebAPIKey(MyEnvironments environment) {
      switch (environment) {
        case MyEnvironments.prod:
          return "";

        case MyEnvironments.dev:
          return "";

        case MyEnvironments.test:
          return "";
      }
      return "AIzaSyAk26J6hSrlvnFrtUvkDLf7uffzFvZ4qW4";
    }

    /// set flavorEnvironment via getter method
    var flavorEnvironment = getFlavorEnvironment() ?? defaultEnvironment;

    /// Finally set environment
    FlavorConfig(
      environment: flavorEnvironment,
      baseUrl: getBaseUrl(flavorEnvironment),
      googleAPIKey: getGoogleAPIKey(flavorEnvironment),
      firebaseWebAPIKey: getFirebaseWebAPIKey(flavorEnvironment),
      isProdEnvironment: checkEnvironment(flavorEnvironment),
      backOfficeUrl: getBackOfficeUrl(flavorEnvironment),
    );
  }
}
