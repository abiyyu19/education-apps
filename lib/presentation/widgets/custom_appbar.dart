import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonVisible;
  final Color color;
  const CustomAppbar({
    super.key,
    this.title,
    this.isBackButtonVisible = false,
    this.color = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 150,
          color: color,
        ),
        Positioned(
          top: 25,
          left: -220,
          child: Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (color == Colors.orange)
                  ? const Color(0xFFE24725)
                  : const Color(0xFF800080),
            ),
          ),
        ),
        Positioned(
          top: 80,
          left: -80,
          child: Container(
            height: 500,
            width: 500,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: -1,
          left: 120,
          child: Container(
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
        Positioned(
          top: 28,
          left: -40,
          child: Container(
            height: 500,
            width: 400,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Visibility(
          visible: isBackButtonVisible,
          child: const Positioned(
            top: 45,
            left: 5,
            child: BackButton(
              color: Colors.white,
            ),
          ),
        ),
        Visibility(
          visible: title != null,
          child: Text(
            title ?? '',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 150);
}
