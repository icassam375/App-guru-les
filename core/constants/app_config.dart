/// Konfigurasi aplikasi yang bukan rahasia.
class AppConfig {
  AppConfig._();

  /// Web client ID untuk Google Sign-In di Android.
  /// Sumber: Firebase Console -> Authentication -> Sign-in method -> Google
  /// -> Web SDK configuration -> Web client ID.
  static const String googleWebClientId =
      '89336405993-2b7e3luhgmtegcqad1ttjve22agrjn6e.apps.googleusercontent.com';
}
