import 'dart:developer';

import 'package:education_app/presentation/widgets/custom_buttom.dart';
import 'package:education_app/providers/app_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  User? user;

  @override
  void initState() {
    super.initState();

    user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      context.read<AppProvider>().changeUser(user);
    } else {
      context.read<AppProvider>().changeUser(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              'EDUCATION',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            ),
            Image.asset(
              'assets/images/books.png',
              height: 200,
              width: 200,
            ),
            const Text(
              'Welcome to Education Apps!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            CustomButton(
              text: 'START',
              size: 40,
              onPressed: () => context.goNamed('main_page'),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Container(
                  height: 20,
                  width: 20,
                  margin: EdgeInsets.only(right: index < 2 ? 10 : 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0 ? Colors.white : Colors.white54,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
