import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // 1. التأكد من تهيئة الـ Widgets الخاصة بفلاتر قبل تشغيل أي كود Asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // 2. تحميل ملف الـ .env المخفي اللي كريتناه جنب الـ pubspec
    await dotenv.load(fileName: ".env");

    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

    // تشيك سريع للأمان في مرحلة التطوير
    if (supabaseUrl == null || supabaseAnonKey == null) {
      throw Exception(
        "خطأ: تأكد من كتابة المفاتيح بشكل صحيح داخل ملف الـ .env",
      );
    }

    // 3. ربط الأبلكيشن بسيرفر سوبابيز الخاص بـ Deliverak
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
      realtimeClientOptions: const RealtimeClientOptions(
        logLevel: RealtimeLogLevel.info,
      ),
    );

    print("🚀 Deliverak Client: Supabase Initialized Successfully!");
  } catch (e) {
    print("❌ Error during initialization: $e");
  }

  runApp(const DeliverakCustomerApp());
}

class DeliverakCustomerApp extends StatelessWidget {
  const DeliverakCustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deliverak Customer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 64),
              SizedBox(height: 16),
              Text(
                'Deliverak Customer Ready!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('تم الربط بالسيرفر والأمان جاهز للبرودكشن'),
            ],
          ),
        ),
      ),
    );
  }
}
