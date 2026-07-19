import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../security/secure_storage.dart';

class MainConfig {
  static bool isFirstTime = true;
  static bool isUserLoggedIn = false;

  static Future<void> init() async {
    try {
      // 1. تحميل ملف البيئة
      await dotenv.load(fileName: ".env");

      // 2. تهيئة Supabase
      await Supabase.initialize(
        url: dotenv.env['SUPABASE_URL']!,
        publishableKey: dotenv.env['SUPABASE_ANON_KEY']!,
        authOptions: FlutterAuthClientOptions(
          localStorage: SecureLocalStorage(),
        ),
      );

      // 3. التحقق من حالة المستخدم (هل شاف الـ Onboarding؟)
      final prefs = await SharedPreferences.getInstance();
      isFirstTime = prefs.getBool('is_first_time') ?? true;

      // 4. التحقق من جلسة المستخدم
      final session = Supabase.instance.client.auth.currentSession;
      isUserLoggedIn = session != null;
    } catch (e) {
      debugPrint("❌ خطأ في التهيئة: $e");
    }
  }
}
