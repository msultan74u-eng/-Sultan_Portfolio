import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sultan_portfolio/constants/app_colors.dart';
import 'package:sultan_portfolio/widgets/Button_widgets/glow_hover_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectSliverDelegate extends StatelessWidget {
  const ProjectSliverDelegate({super.key, required this.colorDelegate});

  final Color colorDelegate;

  Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // يفتح في تاب جديدة في الويب
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurface;
    double width = MediaQuery.of(context).size.width;

    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;

    final primaryColor = isDark
        ? AppColors.darkPrimary
        : AppColors.lightPrimary;

    final textPrimary = isDark
        ? AppColors.textLightContainer
        : AppColors.textDarkContainer;

    final List<String> pathImages = [
      'assets/images/quran_images/001_Banner_Raq_001.jpg',
      'assets/images/register_images/Chatting_App.jpg',
      'assets/images/notes_images/Notes_App.jpg',
      'assets/images/store_images/Store_App.jpg',
      'assets/images/weather_app/Weather_App.jpg',
      'assets/images/news_app/News_App.jpg',
      'assets/images/toku_app/Toku_App.jpg',
      'assets/images/points_counter/Points_Counter.jpg',
    ];
    final List<String> stringList = [
      "Iqra App",
      "Chatting App",
      "Notes App",
      "Store App",
      "Weather App",
      "News App",
      "Toku App",
      "Points Counter App",
    ];
    final List<String> stringUrl = [
      "https://play.google.com/store/apps/details?id=com.sultan.quran_raq",
      "https://github.com/msultan74u-eng/Chatting_App",
      "https://github.com/msultan74u-eng/notes_app",
      "https://github.com/msultan74u-eng/Store_App",
      "https://github.com/msultan74u-eng/Weather_App",
      'https://github.com/msultan74u-eng/News_App',
      "https://github.com/msultan74u-eng/Toku_App",
      "https://github.com/msultan74u-eng/Points_Counter",
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
                        'Projects',
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
                  SizedBox(height: 40),

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
                            crossAxisCount = 1;
                          } else if (width < 800) {
                            crossAxisCount = 2;
                          } else if (width < 1200) {
                            crossAxisCount = 3;
                          } else {
                            crossAxisCount = 4;
                          }

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: pathImages.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 320,
                                  crossAxisSpacing: 24,
                                  mainAxisSpacing: 24,
                                  childAspectRatio: 1.6,
                                ),

                            itemBuilder: (context, index) {
                              final ValueNotifier<bool> isHovered =
                                  ValueNotifier(false);

                              return ValueListenableBuilder<bool>(
                                valueListenable: isHovered,
                                builder: (context, hovered, child) {
                                  return MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    onEnter: (context) =>
                                        isHovered.value = true,
                                    onExit: (context) =>
                                        isHovered.value = false,
                                    child: GestureDetector(
                                      onTap: () => openUrl(stringUrl[index]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: GlowHoverContainer(
                                              width: double.infinity,
                                              height: double.infinity,
                                              color: const Color(0xff151515),
                                              borderColor: const Color(
                                                0xffde81edff,
                                              ),
                                              borderWidth: 1,
                                              glowOpacity: 0.5,
                                              blurRadius: 4,
                                              spreadRadius: 1,
                                              scaleFactor: 1.05,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.asset(
                                                  // "assets/images/quran_images/001_Banner_Raq.jpg",
                                                  pathImages[index],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          AnimatedDefaultTextStyle(
                                            duration: const Duration(
                                              milliseconds: 200,
                                            ),
                                            style: TextStyle(
                                              color: hovered
                                                  ? Colors.cyan
                                                  : primaryColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            child: Text(
                                              stringList[index],
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
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
