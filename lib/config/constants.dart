class Constants {
  static const String apiBaseUrl = 'https://api.jackerbox.com/v1';  // Replace with your actual API base URL
  static const String imageBaseUrl = 'https://storage.jackerbox.com';  // Replace with your actual storage URL
  
  // API Endpoints
  static const String authEndpoint = '/auth';
  static const String usersEndpoint = '/users';
  static const String equipmentEndpoint = '/equipment';
  static const String bookingsEndpoint = '/bookings';
  static const String reviewsEndpoint = '/reviews';
  static const String categoriesEndpoint = '/categories';
  
  // Storage paths
  static const String userAvatarsPath = 'avatars';
  static const String equipmentImagesPath = 'equipment';
  static const String verificationDocsPath = 'verification';
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Cache duration
  static const Duration cacheDuration = Duration(minutes: 5);
  
  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration uploadTimeout = Duration(minutes: 5);
  
  // Validation
  static const int maxImageSize = 5 * 1024 * 1024;  // 5MB
  static const int maxFileSize = 10 * 1024 * 1024;  // 10MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'webp'];
  static const List<String> allowedDocTypes = ['pdf', 'doc', 'docx'];
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;
  static const double defaultElevation = 2.0;
} 