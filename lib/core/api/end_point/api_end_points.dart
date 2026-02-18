class ApiEndPoints {
  static const String baseUrl = 'http://10.10.20.22:3001/api';

  // AUTH ENDPOINTS
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String forgotPassword = '/auth/send-reset-otp';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyOtp = '/auth/verify-reg-otp';
  static const String verifyResetOtp = '/auth/verify-reset-otp';
  static const String resendOtp = '/auth/resend-otp';

  //  USER ENDPOINTS
  static const String wellnessTips = '/wellness-tips';
  static const String updateProfile = '/user/profile';
  static const String changePassword = '/users/change-password';
  static const String deleteAccount = '/user/delete';

  static const String getSpecialties = '/specialist';
  static const String createDoctorInfo = '/doctors/me/profile';

  //  PRODUCT ENDPOINTS
  static const String products = '/products';
  static const String productDetails = '/products';
  static const String deleteProduct = '/products';

  // UPLOAD ENDPOINTS
  static const String uploadImage = '/upload/image';
  static const String uploadGallery = '/upload/gallery';
  static const String uploadDocument = '/upload/document';

  // FAVORITE ENDPOINTS
  static const String toggleFavorite = '/favorites/toggle';
  static const String getFavorites = '/favorites';

  // SEARCH ENDPOINTS
  static const String search = '/search';
}
