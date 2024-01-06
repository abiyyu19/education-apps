import 'package:education_app/presentation/widgets/custom_appbar.dart';
import 'package:education_app/providers/app_providers.dart';
import 'package:education_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: lorem.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Consumer<AppProvider>(
                builder: (context, user, _) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  leading: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  tileColor: Colors.orange,
                  title: Text(
                    user.currentUser?.displayName ?? 'Lorem Name',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  subtitle: Text(
                    user.currentUser?.email ?? 'Lorem Email',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () => (user.currentUser == null)
                      ? context.goNamed('login')
                      : AppProvider()
                          .signOut()
                          .then((value) => context.goNamed('onboarding')),
                ),
              );
            } else {
              return Container(
                height: 75,
                color: Colors.purple,
                alignment: Alignment.center,
                child: Text(
                  lorem[index - 1],
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
          },
          separatorBuilder: (context, index) {
            if (index == 0) {
              return const SizedBox.shrink();
            } else {
              return const Divider(
                height: 0,
                thickness: 1,
                color: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }
}
