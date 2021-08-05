/// common App String class which contain all const string data
class AppStrings {
  static const String font_regular = "InterRegular";
  static const String font_medium = "InterMedium";
  static const String font_semi_bold = "InterSemiBold";
  static const String font_bold = "InterBold";
  static const String font_extra_bold = "InterExtraBold";

  static String devBaseURL = "";
  static String prodBaseURL = "";
  static String testBaseURL = "";

  static String devBackOfficeURL = "";
  static String prodBackOfficeURL = "";
  static String testBackOfficeURL = "";

  static String iosAppId = "";

  static String badNetworkErrorMsg = "No Internet connection 😑";
  static String internalServerErrorMsg = "Couldn't find 😱";
  static String badResponseErrorMsg = "Bad response format 👎";
  static String unauthenticatedErrorMsg = "Unauthenticated user 😱";
  static const String commonErrorMsg = "Something went wrong, Try again later!";
  static String noResultFoundErrorMsg = "No result found 😑";
  static String requestConflictErrorMsg =
      "Request no longer available, Try again later!";

  static String termsAndConCMS = 'TERMS_AND_CONDITIONS';
  static String privacyPolicyCMS = 'PRIVACY_POLICY';

  // firebase dynamic link credentials..
  // static String firebaseWebAPIKey = "AIzaSyBkrfi6bRUREkAlCeyfsyrUdC9CLXwfdXI";
  // static String firebaseDynamicBaseUrl =
  //     "https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=";
  static String domainUriPrefix = "";
  static String previewDynamicLinkBaseUrl = "";

  static String logoUrl = '';

  /// empty state Strings
  static const String appEmptyStateMsg = 'There is nothing here';
  static const String noInternetText = 'Oops! You’re disconnected';
  static const String noInternetSubText = 'Check you internet and try again.';
}
