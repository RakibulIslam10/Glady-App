class ApiEndPoints {
  static final mainDomain = 'http://10.10.20.52:6002'; //https://dodawork.com/
  static final baseUrl = '$mainDomain/';

  /// API End Points
  // Auth
  static const login = 'auth/login';
  static const register = 'auth/register';
  static const verifyEmail = 'auth/activate-account';
  static const resendOtpCode = 'auth/activation-code-resend';
  static const resetPassword = 'auth/reset-password';
  static const forgotPassword = 'auth/forgot-password';
  static const providerRegister = 'provider/provider-register';

  //home
  static const banner = 'banner/get';
  static const privacy = 'manage/get-privacy-policy';
  static const terms = 'manage/get-terms-conditions';
  static const allEbookGet = 'ebooks/get';
  static const blockUser = 'chat/block/';
  static const unBlockUser = 'chat/unblock/';
  static const deleteMessage = 'ebooks/get';
  static const getAllBookCategory = 'book-categories/get';
  static const singlePost = 'home/book';

}
