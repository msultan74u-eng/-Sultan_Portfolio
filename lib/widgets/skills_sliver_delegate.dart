import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sultan_portfolio/constants/app_colors.dart';
import 'package:sultan_portfolio/widgets/Button_widgets/glow_hover_container.dart';

class SkillsSliverDelegate extends StatelessWidget {
  const SkillsSliverDelegate({super.key, required this.colorDelegate});

  final Color colorDelegate;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    double width = MediaQuery.of(context).size.width;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorIcon = isDark ? AppColors.iconSkillsDark : AppColors.iconSkillsLight;

    final backgroundColor = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;
    final surfaceColor = isDark
        ? AppColors.darkSurface
        : AppColors.lightSurface;

    final primaryColor = isDark
        ? AppColors.darkPrimary
        : AppColors.lightPrimary;

    // final textPrimary = isDark
    //     ? AppColors.darkTextPrimary
    //     : AppColors.lightTextPrimary;
    final textPrimary = isDark
        ? AppColors.textLightContainer
        : AppColors.textDarkContainer;

    final List<Widget> iconList = [
      SvgPicture.asset(
        "assets/images/icons_svg/flutter-svgrepo-com.svg",
        width: 40,
        height: 40,
      ),
      SvgPicture.asset(
        "assets/images/icons_svg/dart-svgrepo-com.svg",
        width: 40,
        height: 40,
      ),
      SvgPicture.asset(
        "assets/images/icons_svg/firebase-svgrepo-com.svg",
        width: 40,
        height: 40,
      ),
      SvgPicture.asset(
        "assets/images/icons_svg/git-svgrepo-com.svg",
        width: 45,
        height: 45,
      ),
      SvgPicture.asset(
        "assets/images/icons_svg/api-interface-svgrepo-com.svg",
        width: 40,
        height: 40,
      ),
      SvgPicture.asset(
        "assets/images/icons_svg/cubit-opened-svgrepo-com.svg",
        width: 40,
        height: 40,
      ),
      SvgPicture.asset(
        "assets/images/icons_svg/java-svgrepo-com.svg",
        width: 40,
        height: 40,
      ),
      Image.asset("assets/images/icons_svg/c_sharp.png", width: 40, height: 40),
      Icon(Icons.device_hub),
      Icon(Icons.device_hub),
      Icon(Icons.device_hub),
      // Icon(Icons.account_tree),
    ];
    final List<String> stringList = [
      "Flutter",
      "Dart",
      "Firebase",
      "Git",
      "Restful APIs",
      "Bloc & Cubit",
      "Java",
      "C#",
      "Provider",
      "MVVM",
      "Flavor",
    ];

    return Center(
      child: ConstrainedBox(
        // تحديد أقصى عرض للمحتوى في الويب
        constraints: const BoxConstraints(maxWidth: double.maxFinite),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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

            child: SizedBox(
              width: double
                  .infinity, // ✅ يجعل الـ Container يأخذ عرض الشاشة بالكامل
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  GlowHoverContainer(
                    width: width < 600 ? 200 : width * 0.25,
                    height: width > 600 ? width * 0.25 * 0.22 : 200 * 0.22,
                    // color: const Color(0xff100f0f),
                    color: backgroundColor,
                    borderColor: Colors.cyan,
                    borderWidth: 1,
                    glowOpacity: 0.5,
                    blurRadius: 4,
                    spreadRadius: 1,
                    scaleFactor: 1.15,
                    child: Center(
                      child: AutoSizeText(
                        'Skills',
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 40,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: textPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 800,
                      ), // ✅ عرض الـ Grid فقط
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount;

                          double width = constraints.maxWidth;

                          if (width < 600) {
                            crossAxisCount = 2;
                          } else if (width < 800) {
                            crossAxisCount = 3;
                          } else if (width < 1200) {
                            crossAxisCount = 5;
                          } else {
                            crossAxisCount = 6;
                          }

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: iconList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 6,
                                  childAspectRatio: 1,
                                ),

                            itemBuilder: (context, index) {
                              final ValueNotifier<bool> isHovered =
                                  ValueNotifier(false);

                              return ValueListenableBuilder<bool>(
                                valueListenable: isHovered,
                                builder: (context, hovered, child) {
                                  return MouseRegion(
                                    onEnter: (context) =>
                                        isHovered.value = true,
                                    onExit: (context) =>
                                        isHovered.value = false,
                                    child: Center(
                                      child: GlowHoverContainer(
                                        width: 120,
                                        height: 120,
                                        // color:  Color(0xff151515),
                                        color:  colorIcon,
                                        borderColor: Colors.cyan,
                                        borderWidth: 1,
                                        glowOpacity: 0.5,
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                        scaleFactor: 1.15,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            iconList[index],
                                            const SizedBox(height: 16),
                                            AnimatedDefaultTextStyle(
                                              duration: const Duration(
                                                milliseconds: 200,
                                              ),
                                              style: TextStyle(
                                                color: hovered
                                                    ? Colors.cyan
                                                    : Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              child: Text(stringList[index]),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
