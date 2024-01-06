import 'package:education_app/presentation/widgets/custom_appbar.dart';
import 'package:education_app/presentation/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppbar(
          color: Colors.purple,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150.0,
                  width: 150.0,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(width: 4.0, color: Colors.yellow),
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/book.svg',
                  ),
                ),
                const Text(
                  'LITERATURE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Lorem Ipsum dolor sit amet? Lorem Ipsum dolor sit amet?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    card('12', 'Chapters'),
                    const SizedBox(
                      width: 20,
                    ),
                    card('30', 'Pages'),
                  ],
                ),
                CustomButton(
                  text: 'Lorem',
                  onPressed: () {},
                  size: 24,
                  isLight: false,
                )
              ],
            ),
          ),
        ));
  }

  Container card(String title, String subtitle) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(width: 4.0, color: Colors.yellow),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(),
              child: Text(
                title,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
