import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'features/equipment/presentation/screens/equipment_list_screen.dart';
import 'features/equipment/presentation/screens/equipment_details_screen.dart';
import 'features/equipment/presentation/screens/equipment_form_screen.dart';
import 'features/equipment/providers/equipment_provider.dart';
import 'features/auth/providers/auth_provider.dart';
import 'features/booking/providers/booking_provider.dart';
import 'features/booking/presentation/screens/booking_list_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/signup_screen.dart';
import 'features/info/presentation/screens/how_it_works_screen.dart';
import 'features/legal/presentation/screens/legal_screen.dart';
import 'features/legal/presentation/screens/terms_screen.dart';
import 'features/legal/presentation/screens/privacy_screen.dart';
import 'features/legal/presentation/screens/cancellation_screen.dart';
import 'features/legal/presentation/screens/insurance_screen.dart';
import 'features/legal/presentation/screens/host_agreement_screen.dart';
import 'features/legal/presentation/screens/guidelines_screen.dart';
import 'features/legal/presentation/screens/copyright_screen.dart';
import 'features/legal/presentation/screens/cookies_screen.dart';
import 'features/legal/presentation/screens/become_host_screen.dart';
import 'features/legal/presentation/screens/gift_cards_screen.dart';
import 'features/legal/presentation/screens/host_onboarding_screen.dart';
import 'features/support/presentation/screens/support_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Initialize providers that need SharedPreferences
  final authProvider = await AuthProvider.create();
  final bookingProvider = await BookingProvider.create();
  
  runApp(MyApp(
    authProvider: authProvider,
    bookingProvider: bookingProvider,
  ));
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  final BookingProvider bookingProvider;

  const MyApp({
    super.key,
    required this.authProvider,
    required this.bookingProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => EquipmentProvider()),
        ChangeNotifierProvider.value(value: bookingProvider),
      ],
      child: Builder(
        builder: (context) {
          final router = GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const EquipmentListScreen(),
              ),
              // Auth Routes
              GoRoute(
                path: '/auth/login',
                builder: (context, state) => const LoginScreen(),
              ),
              GoRoute(
                path: '/auth/signup',
                builder: (context, state) => const SignupScreen(),
              ),
              // Info Routes
              GoRoute(
                path: '/how-it-works',
                builder: (context, state) => const HowItWorksScreen(),
              ),
              // Equipment Routes
              GoRoute(
                path: '/equipment/add',
                builder: (context, state) => const EquipmentFormScreen(),
              ),
              GoRoute(
                path: '/equipment/:id',
                builder: (context, state) => EquipmentDetailsScreen(
                  equipmentId: state.pathParameters['id']!,
                ),
              ),
              GoRoute(
                path: '/equipment/:id/edit',
                builder: (context, state) => EquipmentFormScreen(
                  equipmentId: state.pathParameters['id'],
                ),
              ),
              GoRoute(
                path: '/bookings',
                builder: (context, state) => const BookingListScreen(),
              ),
              // Legal Routes
              GoRoute(
                path: '/legal',
                builder: (context, state) => const LegalScreen(),
              ),
              GoRoute(
                path: '/legal/terms',
                builder: (context, state) => const TermsScreen(),
              ),
              GoRoute(
                path: '/legal/privacy',
                builder: (context, state) => const PrivacyScreen(),
              ),
              GoRoute(
                path: '/legal/cancellation',
                builder: (context, state) => const CancellationScreen(),
              ),
              GoRoute(
                path: '/legal/insurance',
                builder: (context, state) => const InsuranceScreen(),
              ),
              GoRoute(
                path: '/legal/host-agreement',
                builder: (context, state) => const HostAgreementScreen(),
              ),
              GoRoute(
                path: '/legal/guidelines',
                builder: (context, state) => const GuidelinesScreen(),
              ),
              GoRoute(
                path: '/legal/copyright',
                builder: (context, state) => const CopyrightScreen(),
              ),
              GoRoute(
                path: '/legal/cookies',
                builder: (context, state) => const CookiesScreen(),
              ),
              // Add missing routes
              GoRoute(
                path: '/become-host',
                builder: (context, state) => const BecomeHostScreen(),
              ),
              GoRoute(
                path: '/host/onboarding',
                builder: (context, state) => const HostOnboardingScreen(),
              ),
              GoRoute(
                path: '/gift-cards',
                builder: (context, state) => const GiftCardsScreen(),
              ),
              GoRoute(
                path: '/support',
                builder: (context, state) => const SupportScreen(),
              ),
            ],
          );

          return MaterialApp.router(
            title: 'Jackerbox',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF2B6BE6), // Primary blue
                secondary: const Color(0xFF00A699), // Teal accent
                tertiary: const Color(0xFFFF5A5F), // Coral accent
                background: Colors.white,
                surface: Colors.white,
                brightness: Brightness.light,
              ),
              textTheme: const TextTheme(
                displayLarge: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                displayMedium: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                titleLarge: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
                titleMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                bodyLarge: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
                bodyMedium: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              cardTheme: CardTheme(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            routerConfig: router,
          );
        }
      ),
    );
  }
}
