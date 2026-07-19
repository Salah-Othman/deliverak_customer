# Deliverak - Agent Instructions

## Project
Multi-app Flutter delivery platform for Abu Qurqas. Three apps planned: Customer, Driver, Vendor. Only `deliverak_customer/` exists yet.

## Quick Start
cd deliverak_customer && flutter pub get && flutter run

## Key Commands
flutter analyze          # lint check
dart run flutter_launcher_icons    # regenerate app icon
dart run flutter_native_splash:create  # regenerate splash

## Architecture
- Feature-First: lib/core/ + lib/features/
- State: Cubit (flutter_bloc)
- Backend: Supabase (PostgreSQL + Auth + Realtime)
- Routing: go_router with auth/onboarding redirect
- DI: get_it (planned)
- Env: flutter_dotenv loads .env

## Critical Gotchas
1. .env committed to git with real Supabase credentials — needs git rm --cached before any public push
2. All init logic in main_config.dart — clean separation from main.dart
3. Global mutable state: isFirstTime, isUserLoggedIn in MainConfig imported by app_router.dart
4. .env bundled into release APK as Flutter asset (anon key is safe to ship, URL reveals infra)
5. No test/ directory — zero tests exist
6. Android requires Java 17, Kotlin DSL (build.gradle.kts)
7. Arabic UI — all text and comments in Arabic, RTL enabled in MaterialApp
8. Route paths mismatch — AppRoutes defines /shop-details and /signup but not wired in AppRouter

## Implemented (Stage 1 Complete)
- main_config.dart — centralized Supabase/Firebase/DI init
- app.dart — separate MaterialApp from main.dart with RTL + theme
- core/constants/ — AppColors, AppStrings
- core/theme/ — AppTheme with orange primary color
- core/errors/ — Failure classes + FailureHandler for Arabic messages
- core/network/ — SupabaseClientHelper

## Implemented (Stage 2 Complete)
- features/auth/ — Complete auth module with OTP login
- auth/data/ — AuthRemoteDataSource (Supabase auth)
- auth/domain/ — AuthRepository + AuthCubit (state management)
- auth/presentation/ — LoginScreen + OtpScreen
- Routing updated with BlocProvider for AuthCubit
- HomeScreen placeholder with logout functionality

## Implemented (Security)
- flutter_secure_storage — encrypts Supabase session tokens
- core/security/ — SecureLocalStorage extends LocalStorage
- Supabase.initialize() configured with SecureLocalStorage

## Stage 3 Plan (MVP Core — Not Yet Implemented)
- Models: Vendor, Product, Category, Order, OrderItem, CartItem (plain Dart with fromJson)
- Features: vendors/ (list + detail), products/ (list + detail), cart/ (local storage), orders/ (create + list)
- Navigation: Bottom nav with ShellRoute (Home, Cart, Orders, Profile)
- Theme: cardTheme, bottomNavigationBarTheme, chipTheme
- SQL: categories table, vendor/product columns, RLS policies

## Planned (Not Yet Implemented)
- firebase_crashlytics, firebase_messaging
- SSL Pinning, code obfuscation for release
- deliverak_driver/, deliverak_vendor/ apps

## Dependencies
| Package | Purpose |
|---------|---------|
| supabase_flutter | Backend |
| flutter_bloc | State (Cubit) |
| go_router | Routing |
| get_it | DI |
| flutter_dotenv | Env vars |
| shared_preferences | Local storage (onboarding flag) |
| flutter_secure_storage | Encrypted session storage |
| flutter_native_splash | Splash screen |
| flutter_localizations | RTL support |

## Folder Structure (Current)
lib/
├── core/
│   ├── config/
│   │   └── main_config.dart
│   ├── constants/
│   │   ├── app_colors.dart
│   │   └── app_strings.dart
│   ├── errors/
│   │   ├── failures.dart
│   │   └── failure_handler.dart
│   ├── network/
│   │   └── supabase_client.dart
│   ├── routing/
│   │   ├── app_router.dart
│   │   └── app_routes.dart
│   ├── security/
│   │   └── secure_storage.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── utils/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   └── auth_remote_data_source.dart
│   │   ├── domain/
│   │   │   ├── auth_cubit.dart
│   │   │   └── auth_repository.dart
│   │   └── presentation/
│   │       ├── login_screen.dart
│   │       └── otp_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   └── onboarding/
│       └── onboarding_view.dart
├── app.dart
└── main.dart
