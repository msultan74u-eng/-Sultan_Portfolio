import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sultan_portfolio/constants/app_colors.dart';
import 'package:sultan_portfolio/main.dart';
import '../views/full_screen_image.dart';

class MainSliverPortfolio extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const MainSliverPortfolio({super.key, required this.onToggleTheme});

  @override
  State<MainSliverPortfolio> createState() => _MainSliverPortfolioState();
}

class _MainSliverPortfolioState extends State<MainSliverPortfolio> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;

    final surfaceColor = isDark
        ? AppColors.darkSurface
        : AppColors.lightSurface;

    final primaryColor = isDark
        ? AppColors.darkPrimary
        : AppColors.lightPrimary;

    final textPrimary = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;

    return SliverAppBar(
      pinned: false,
      stretch: true,
      expandedHeight: 320,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final top = constraints.biggest.height;
          final t = (top - kToolbarHeight) / (320 - kToolbarHeight);
          final clampT = t.clamp(0.0, 1.0);

          return Stack(
            fit: StackFit.expand,
            children: [
              /// 🔹 الخلفية الرئيسية (Primary Color)
              Positioned(
                top: -(1 - clampT) * 40,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(color: backgroundColor),
                ),
              ),

              /// 🔹 Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.45 * (1 - clampT) + 0.15),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              /// 🔹 Blur Effect عند collapse
              if (clampT < 0.2)
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: (0.2 - clampT) * 10,
                    sigmaY: (0.2 - clampT) * 10,
                  ),
                  child: Container(color: Colors.black.withOpacity(0.1)),
                ),

              /// 🔹 Menu Icon
              // Align(
              //   alignment: Alignment.topRight,
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 0, right: 12),
              //     child: Opacity(
              //       opacity: (1 - clampT) > 0.02 ? 1.0 - clampT : 1.0,
              //       child: GestureDetector(
              //         onTap: widget.onToggleTheme,
              //         child: SizedBox(
              //           height: kToolbarHeight,
              //           child: ValueListenableBuilder(
              //             valueListenable: themeNotifier,
              //             builder: (context, ThemeMode mode, _) {
              //               final isDark = mode == ThemeMode.dark;
              //
              //               return Container(
              //                 width: 35,
              //                 height: 35,
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.circle,
              //
              //                   color: Colors.transparent,
              //                 ),
              //                 child: Icon(
              //                   isDark
              //                       ? Icons.light_mode
              //                       : Icons.dark_mode_sharp,
              //                   color: isDark
              //                       ? Colors.amberAccent
              //                       : Colors.black87,
              //                 ),
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              /// 🔹 Avatar + Role
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Avatar
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => FullScreenImage(
                                heroTag: 'avatarHero',
                                imageUrl: themeNotifier.value == ThemeMode.dark
                                    ? 'assets/images/M_Image.png'
                                    : 'assets/images/M_Image_00.png',
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'avatarHero',
                          child: Container(
                            width: lerpDouble(10, 250, clampT),
                            height: lerpDouble(10, 250, clampT),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: primaryColor.withOpacity(0.2),
                                  blurRadius: 30,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                      
                              image: DecorationImage(
                                image: AssetImage(
                                  themeNotifier.value == ThemeMode.dark
                                      ? 'assets/images/M_Image.png'
                                      : 'assets/images/M_Image_00.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// Role Label
                    Opacity(
                      opacity: clampT,
                      child: Column(
                        children: [
                          const SizedBox(height: 12),

                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: 36,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: surfaceColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                'Flutter Developer',
                                maxLines: 1,
                                minFontSize: 10,
                                maxFontSize: 24,
                                style: TextStyle(
                                  color: textPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      stretchTriggerOffset: 120,
    );
  }
}
