import 'package:vector_math/vector_math.dart';

final class Environment {
  const Environment._();

  static const String apiKey = String.fromEnvironment('API_KEY');

  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'xxx',
  );

  static const bool isProduction = bool.fromEnvironment('IS_PRODUCTION');


  static const bool mockLocation = bool.fromEnvironment('MOCK_LOCATION');

  static const String mockLatitude = String.fromEnvironment(
    'MOCK_LATITUDE',
    defaultValue: '0.0',
  );

  static const String mockLongitude = String.fromEnvironment(
    'MOCK_LONGITUDE',
    defaultValue: '0.0',
  );


  static const String mockUserToken = String.fromEnvironment('MOCK_USER_TOKEN');

  static const String mockUserEmail = String.fromEnvironment('MOCK_USER_EMAIL');

  static const String mockUserPassword = String.fromEnvironment(
    'MOCK_USER_PASSWORD',
  );

  static const bool shouldSkipAuthentication = bool.fromEnvironment(
    'SHOULD_SKIP_AUTHENTICATION',
  );

  static Vector2 get defaultPosition => Vector2(
    double.parse(mockLatitude),
    double.parse(mockLongitude),
  );

  static String forceLayout = '';

  static String get ciCommitBranch => '';

  static String get ciCommitShortSha => '';

  static String get ciBuildDate => '';
}
