import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_portfolio/constants/app_colors.dart';

class ContactsCard extends StatefulWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const ContactsCard({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  State<ContactsCard> createState() => ContactsCardState();
}

class ContactsCardState extends State<ContactsCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final textcolors = isDark
        ? AppColors.textLightContainer
        : AppColors.textDarkContainer;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: hovered
            ? (Matrix4.identity()..scale(1.15))
            : Matrix4.identity(),
        curve: Curves.easeOut,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: MediaQuery.of(context).size.width < 600 ? 40 : 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff151515),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: hovered ? Colors.cyan : const Color(0xffde81edff),
                    width: 1.2,
                  ),
                  boxShadow: hovered
                      ? [
                          BoxShadow(
                            color: Colors.cyan.withOpacity(0.4),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: SvgPicture.asset(widget.image, width: 32, height: 32),
                ),
              ),
              const SizedBox(height: 14),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  color: hovered ? Colors.cyan : textcolors,
                  fontWeight: FontWeight.w500,
                ),
                child: Text(widget.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
