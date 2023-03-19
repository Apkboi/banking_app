
class Constants {

  static late Map<String, dynamic> _config;
 Constants._();


  //
  //  static get baseUrl {
  //   return _config[_Config.baseUrl];
  // }


  static const userCredentials = 'login_user_credentials';
  static const themeKey = "paybliz_theme_key";
  static const themeMode = "paybliz_theme_mode";
  static const firstTimeUserKey = "first_time_user_key";
  static const paystackApiKey = "sk_test_9e498a3e835b2403bf152afe55fbee89c6f2c3d1";
  static const baseUrl = "https://mobile-banking-api.herokuapp.com";
  static const oneSignalAppId = "8c12af6c-de37-48b5-bbfc-51e48b47d805";

  // static const paystackApiKey = "sk_test_9e498a3e835b2403bf152afe55fbee89c6f2c3d1";

}

/// Allows this class to be only visible to this file*/
///
class _Config {
  static const baseUrl = "BASE_URL";
  static const buildGradient = "BUILD_GRADIENT";
  static const sentryDSN = "SENTRY_DSN";
  static const sentryEnv = "SENTRY_ENV";
  static const flavor = "ENV";

  // static Map<String, dynamic> debugConstants = {
  //   baseUrl: "https://developed.paybliz.com/",
  //   buildGradient: "dev",
  //   sentryDSN:
  //       '',
  //   sentryEnv: 'dev',
  //   flavor: Flavor.dev
  // };
  // static Map<String, dynamic> prodConstants = {
  //   baseUrl: "https://paybliz.com/",
  //   buildGradient: "production",
  //   sentryDSN:
  //       '',
  //   sentryEnv: 'production',
  //   flavor: Flavor.prod
  // };
}
