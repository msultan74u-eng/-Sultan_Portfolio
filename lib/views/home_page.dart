import 'package:flutter/material.dart';
import 'package:sultan_portfolio/main.dart';
import 'package:sultan_portfolio/widgets/about_sliver_delegate.dart';
import 'package:sultan_portfolio/widgets/appbar_sliver_portfolio.dart';
import 'package:sultan_portfolio/widgets/contact_sliver_delegate.dart';
import 'package:sultan_portfolio/widgets/portfolio_drawer.dart';
import 'package:sultan_portfolio/widgets/project_sliver_delegate.dart';
import 'package:sultan_portfolio/widgets/resume_sliver_delegate.dart';
import 'package:sultan_portfolio/widgets/skills_sliver_delegate.dart';
import '../widgets/main_sliver_portfolio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();
  final resumeKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    if (Navigator.of(context).canPop()) {
      Navigator.pop(context);
    }

    if (key.currentContext == null) return;

    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: PortfolioDrawer(
        onSectionTap: scrollToSection,
        homeKey: homeKey,
        aboutKey: aboutKey,
        skillsKey: skillsKey,
        projectsKey: projectsKey,
        contactKey: contactKey,
        resumeKey: resumeKey,
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          AppBarSliverPortfolio(
            onSectionTap: scrollToSection,
            homeKey: homeKey,
            aboutKey: aboutKey,
            skillsKey: skillsKey,
            projectsKey: projectsKey,
            contactKey: contactKey,
            resumeKey: resumeKey,
          ),
          SliverToBoxAdapter(
            child: Divider(color: Colors.cyan, thickness: 0.5, height: 1),
          ),

          MainSliverPortfolio(
            key: homeKey,
            onToggleTheme: () {
              themeNotifier.value = themeNotifier.value == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
            },
          ),
          SliverToBoxAdapter(
            child: AboutSliverDelegate(
              key: aboutKey,
              colorDelegate: Colors.transparent,
            ),
          ),

          SliverToBoxAdapter(
            key: skillsKey,
            child: SkillsSliverDelegate(colorDelegate: Colors.transparent),
          ),
          SliverToBoxAdapter(
            child: ProjectSliverDelegate(
              key: projectsKey,
              colorDelegate: Colors.transparent,
            ),
          ),
          SliverToBoxAdapter(
            child: ContactsSliverDelegate(
              key: contactKey,
              colorDelegate: Colors.transparent,
            ),
          ),
          SliverToBoxAdapter(
            child: ResumeSliverDelegate(
              key: resumeKey,
              colorDelegate: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
