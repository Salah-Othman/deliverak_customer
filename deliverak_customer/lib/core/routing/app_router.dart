import 'package:deliverak_customer/features/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../config/main_config.dart';
import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    // التوجيه الذكي اللحظي بناءً على الكشف المسبق
    initialLocation: MainConfig.isFirstTime
        ? AppRoutes.onboarding
        : (MainConfig.isUserLoggedIn ? AppRoutes.home : AppRoutes.login),

    redirect: (BuildContext context, GoRouterState state) {
      // لو مستخدم قديم وبيحاول يروح للـ Onboarding يدوي، امنعه ووديه شاشته الصح
      if (!MainConfig.isFirstTime &&
          state.matchedLocation == AppRoutes.onboarding) {
        return MainConfig.isUserLoggedIn ? AppRoutes.home : AppRoutes.login;
      }
      return null;
    },

    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (BuildContext context, GoRouterState state) {
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(
            body: Center(child: Text('شاشة تسجيل الدخول')),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (BuildContext context, GoRouterState state) {
          return const Scaffold(
            body: Center(child: Text('الشاشة الرئيسية')),
          );
        },
      ),
    ],
  );
}
