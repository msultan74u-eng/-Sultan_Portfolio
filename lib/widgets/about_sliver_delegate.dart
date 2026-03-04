import 'package:flutter/material.dart';
import 'package:sultan_portfolio/widgets/Button_widgets/glow_hover_container.dart';

class AboutSliverDelegate extends StatelessWidget {
  const AboutSliverDelegate({super.key, required this.colorDelegate});

  final Color colorDelegate;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Center(
      child: ConstrainedBox(
        // تحديد أقصى عرض للمحتوى في الويب
        constraints: const BoxConstraints(maxWidth: double.maxFinite),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorDelegate,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.orangeAccent.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  spreadRadius: 1,
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 600;
                final imageSize = constraints.maxWidth * 0.22;

                return isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GlowHoverContainer(
                            width: 200,
                            height: 115,
                            color: Colors.blue,
                            borderColor: Colors.cyan,
                            borderWidth: 1,
                            glowOpacity: 0.5,
                            blurRadius: 4,
                            spreadRadius: 1,
                            scaleFactor: 1.15,

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                "assets/images/flutter.jpg",
                                // height: 200,
                                // width: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildText(textColor),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          // النص ياخد مساحة أكبر
                          Expanded(flex: 4, child: _buildText(textColor)),

                          SizedBox(width: imageSize * 0.25),

                          SizedBox(
                            width: imageSize, // تحكم في العرض هنا
                            child: GlowHoverContainer(
                              width: imageSize,
                              height: imageSize*0.6,
                              color: Colors.blue,
                              borderColor: Colors.cyan,
                              borderWidth: 1,
                              glowOpacity: 0.4,
                              blurRadius: 12,
                              spreadRadius: 2,
                              scaleFactor: 1.05,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  "assets/images/flutter.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: imageSize * 0.18),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(Color textColor) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: TextStyle(fontSize: 16, height: 1.7, color: textColor),
        children: const [
          TextSpan(
            text:
                "I am a mobile application developer specializing in building modern user interfaces "
                "and high-performance applications using Flutter framework.\n\n",
          ),
          TextSpan(
            text:
                "I develop responsive applications that run on both Android and iOS platforms, "
                "with a strong focus on code quality, user experience, and application performance.\n\n",
          ),
          TextSpan(
            text:
                "I always strive to learn new technologies and improve my development skills.",
          ),
        ],
      ),
    );
  }
}
