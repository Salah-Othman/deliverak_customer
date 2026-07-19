import 'failures.dart';

class FailureHandler {
  static String toArabicMessage(Failure failure) {
    return failure.message;
  }

  static String fromException(dynamic exception) {
    if (exception is Failure) {
      return toArabicMessage(exception);
    }
    return 'حدث خطأ غير متوقع';
  }
}
