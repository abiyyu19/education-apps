import 'dart:developer';

import 'package:education_app/presentation/pages/main_page.dart';
import 'package:education_app/presentation/widgets/custom_appbar.dart';
import 'package:education_app/providers/app_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(
        title: 'Login Page',
        isBackButtonVisible: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                log('Test');
                AppProvider().signInWithGoogle().then((value) {
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    context.read<AppProvider>().changeUser(user);
                    Future.delayed(
                      const Duration(seconds: 1),
                    );
                    context.goNamed('main_page');
                  }
                });
              },
              child: SvgPicture.asset(
                'assets/svg/android_light_sq_SI.svg',
                height: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an Account?',
                ),
                TextButton(
                  onPressed: () => {
                    context.goNamed('register'),
                  },
                  child: const Text(
                    'Register!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
