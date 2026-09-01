/// Route names used with Navigator.pushNamed / the MaterialApp routes table.
/// Kept as constants so a typo in a route name becomes a compile-time
/// reference error somewhere obvious, instead of a silent runtime failure.
class AppRoutes {
  AppRoutes._();

  static const String unlock = '/unlock';
  static const String dashboard = '/dashboard';
  static const String credentials = '/credentials';
  static const String documents = '/documents';
  static const String profile = '/profile';
  static const String social = '/social';
  static const String applock = '/applock';
  static const String authenticator = '/authenticator';
}
