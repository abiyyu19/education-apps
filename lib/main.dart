import 'package:education_app/firebase_options.dart';
import 'package:education_app/presentation/pages/login/login_page.dart';
import 'package:education_app/presentation/pages/main_page.dart';
import 'package:education_app/presentation/pages/onboarding/oboarding_page.dart';
import 'package:education_app/presentation/pages/register/register_page.dart';
import 'package:education_app/providers/app_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/',
        name: 'main_page',
        builder: (context, state) => const MainPage(),
        routes: [
          GoRoute(
              path: 'login',
              name: 'login',
              builder: (context, state) => const LoginPage(),
              routes: [
                GoRoute(
                  path: 'register',
                  name: 'register',
                  builder: (context, state) => const RegisterPage(),
                )
              ])
        ],
      )
    ],
    initialLocation: '/onboarding',
    debugLogDiagnostics: true,
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
