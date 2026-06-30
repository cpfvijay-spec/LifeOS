class AppConstants {
  // App Info
  static const String appName = 'LifeOS';
  static const String appVersion = '1.0.0';

  // Durations
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shortAnimationDuration = Duration(milliseconds: 150);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // Padding & Margins
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  // Border Radius
  static const double defaultBorderRadius = 12.0;
  static const double mediumBorderRadius = 16.0;
  static const double largeBorderRadius = 24.0;

  // Font Sizes
  static const double fontSize12 = 12.0;
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize18 = 18.0;
  static const double fontSize20 = 20.0;
  static const double fontSize24 = 24.0;
  static const double fontSize28 = 28.0;
  static const double fontSize32 = 32.0;

  // Constraints
  static const double maxWidth = 1200.0;
  static const double minHeight = 100.0;

  // API
  static const String baseUrl = 'https://api.lifeos.app';
  static const int timeoutDuration = 30;

  // Cache
  static const int cacheExpiry = 24 * 60 * 60; // 24 hours

  // Limits
  static const int maxDescriptionLength = 500;
  static const int maxNameLength = 100;
  static const int maxTitleLength = 50;

  // Weather API
  static const String openWeatherApiKey = 'YOUR_API_KEY_HERE';
  static const String openWeatherBaseUrl = 'https://api.openweathermap.org/data/2.5';
}
