import 'package:flutter/material.dart';
import 'package:sultan_portfolio/main.dart';

class PortfolioDrawer extends StatelessWidget {
  final Function(GlobalKey) onSectionTap;
  final GlobalKey homeKey;
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey projectsKey;
  final GlobalKey contactKey;
  final GlobalKey resumeKey;

  const PortfolioDrawer({
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
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            /// ===== Profile Section =====
            CircleAvatar(
              radius: 45,
              child: Image(
                image: AssetImage(
                  themeNotifier.value == ThemeMode.dark
                      ? 'assets/images/M_Image.png'
                      : 'assets/images/M_Image_00.png',
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Mohamed Sultan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Flutter Developer",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            const Divider(),

            /// ===== Menu Items =====
            Expanded(
              child: ListView(
                children: [
                  _drawerItem(
                    icon: Icons.home,
                    title: "Home",
                    onTap: () => onSectionTap(homeKey),
                  ),
                  _drawerItem(
                    icon: Icons.person_outline,
                    title: "About",
                    onTap: () => onSectionTap(aboutKey),
                  ),

                  _drawerItem(
                    icon: Icons.psychology_outlined,
                    title: "Skills",
                    onTap: () => onSectionTap(skillsKey),
                  ),

                  _drawerItem(
                    icon: Icons.code_outlined,
                    title: "Projects",
                    onTap: () => onSectionTap(projectsKey),
                  ),

                  _drawerItem(
                    icon: Icons.contact_mail_outlined,
                    title: "Contact",
                    onTap: () => onSectionTap(contactKey),
                  ),

                  _drawerItem(
                    icon: Icons.description_outlined,
                    title: "Resume",
                    onTap: () => onSectionTap(resumeKey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHover = false;

        return MouseRegion(
          onEnter: (context) => setState(() => isHover = true),
          onExit: (context) => setState(() => isHover = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: isSelected
                  ? Theme.of(context).primaryColor.withOpacity(0.1)
                  : isHover
                  ? Colors.blue.withOpacity(0.05)
                  : Colors.transparent,
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 4,
              ),

              leading: Icon(
                icon,
                size: 22,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),

              title: Text(
                title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),

              trailing: isSelected
                  ? Container(
                      width: 6,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  : null,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              onTap: onTap,
            ),
          ),
        );
      },
    );
  }
}
