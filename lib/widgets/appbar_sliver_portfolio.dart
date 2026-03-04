import 'package:flutter/material.dart';
import 'package:sultan_portfolio/constants/app_colors.dart';
import 'package:sultan_portfolio/main.dart';

class AppBarSliverPortfolio extends StatefulWidget {
  final Function(GlobalKey) onSectionTap;

  final GlobalKey aboutKey;
  final GlobalKey homeKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;
  final GlobalKey resumeKey;

  const AppBarSliverPortfolio({
    super.key,
    required this.onSectionTap,
    required this.homeKey,
    required this.aboutKey,
    required this.skillsKey,
    required this.projectsKey,
    required this.contactKey,
    required this.resumeKey,
  });

  @override
  State<AppBarSliverPortfolio> createState() => _AppBarSliverPortfolioState();
}

class _AppBarSliverPortfolioState extends State<AppBarSliverPortfolio> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final width = MediaQuery.of(context).size.width;

    final backgroundColor = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;
    return SliverAppBar(
      // floating: true,
      // snap: true,
      pinned: true,
      floating: false,
      snap: false,
      elevation: 0,
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: width < 600
          ? Text(
              ///    Button showing myName in center
              'Mohamed Sultan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: isDark ? Colors.cyan : Colors.indigo,
                fontFamily: "Stardom-Regular",

              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _appBarButton(
                    'Home',
                    () => widget.onSectionTap(widget.homeKey),
                  ),
                  SizedBox(width: 16),
                  _appBarButton(
                    'About',
                    () => widget.onSectionTap(widget.aboutKey),
                  ),
                  SizedBox(width: 16),
                  _appBarButton(
                    'Skills',
                    () => widget.onSectionTap(widget.skillsKey),
                  ),
                  SizedBox(width: 16),
                  _appBarButton(
                    'Projects',
                    () => widget.onSectionTap(widget.projectsKey),
                  ),
                  SizedBox(width: 16),
                  _appBarButton(
                    'Contact',
                    () => widget.onSectionTap(widget.contactKey),
                  ),
                  SizedBox(width: 16),
                  _appBarButton(
                    'Resume',
                    () => widget.onSectionTap(widget.resumeKey),
                  ),
                ],
              ),
            ),
      leadingWidth: width >= 600 ? 200 : 56,
      leading: width < 600
          ? IconButton(
              ///    Button showing Drawer
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu),
            )
          : Padding(
              ///    Button showing myName in left
              padding: const EdgeInsets.all(12),
              child: Text(
                'Mohamed Sultan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isDark ? Colors.cyan : Colors.indigo,
                  fontFamily: "Stardom-Regular",
                ),
              ),
            ),
      actions: [
        ///    Button changing theme
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: ValueListenableBuilder(
            valueListenable: themeNotifier,
            builder: (context, ThemeMode mode, _) {
              final isDark = mode == ThemeMode.dark;

              return InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  themeNotifier.value = isDark
                      ? ThemeMode.light
                      : ThemeMode.dark;
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                  ),
                  child: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    color: isDark ? Colors.amberAccent : Colors.black87,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _appBarButton(String title, VoidCallback onTap) {
    return ElevatedButton(onPressed: onTap, child: Text(title));
  }
}
